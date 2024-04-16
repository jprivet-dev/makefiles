#
# EXECUTABLES (LOCAL)
#

COMPOSE_V1 := $(shell docker-compose version 2> /dev/null)
COMPOSE_V2 := $(shell docker compose version 2> /dev/null)
LOCAL_PHP  := $(shell php -v 2> /dev/null)

ifdef COMPOSE_V2
	DOCKER_COMPOSE = docker compose
else ifdef COMPOSE_V1
	DOCKER_COMPOSE = docker-compose
endif

ifdef DOCKER_COMPOSE
	CONTAINER_PHP = $(DOCKER_COMPOSE) exec php
else ifndef LOCAL_PHP
$(error No dockerized or local PHP interpreter)
endif

PHP = $(CONTAINER_PHP) php

#
# COLORS
#

RESET = "\\033[0m"
BLUE = "\\033[34m"
GREEN = "\\033[32m"
RED = "\\033[31m"
YELLOW = "\\033[33m"
UNDERLINE = "\\033[4m"

## — 🎵 🐘 THE PHP DOCKER MAKEFILE 🐘 🎵 ——————————————————————————————————————

# Print self-documented Makefile:
# $ make
# $ make help

.DEFAULT_GOAL = help
.PHONY: help
help: ## Print self-documented Makefile
	@grep -E '(^[.a-zA-Z_-]+[^:]+:.*##.*?$$)|(^#{2})' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = "## "}; \
		{ \
			split($$1, command, ":"); \
			target=command[1]; \
			description=$$2; \
			# --- space --- \
			if (target=="##") \
				printf "\033[33m%s\n", ""; \
			# --- title --- \
			else if (target=="" && description!="") \
				printf "\033[33m\n%s\n", description; \
			# --- command + description --- \
			else if (target!="" && description!="") \
				printf "\033[32m  %-30s \033[0m%s\n", target, description; \
			# --- do nothing --- \
			else \
				; \
		}'
	@echo

## — PROJECT 🚀 ———————————————————————————————————————————————————————————————

.PHONY: start
start: dc_up_d info ## Start the project (implies detached mode)

.PHONY: stop
stop: dc_down ## Stop the project

.PHONY: info
info: ## Show info
	@echo "Go on $(GREEN)http://0.0.0.0:8000/$(RESET)"

## — DOCKER 🐳 ————————————————————————————————————————————————————————————————

.PHONY: dc_up
dc_up: ## Start the container
	$(DOCKER_COMPOSE) up

.PHONY: dc_up_d
dc_up_d: ## Start the container (wait for services to be running|healthy - detached mode)
	$(DOCKER_COMPOSE) up --remove-orphans --wait

.PHONY: dc_down
dc_down: ## Stop the container
	$(DOCKER_COMPOSE) down

.PHONY: dc_build
dc_build: ## Build or rebuild services
	$(DOCKER_COMPOSE) build

.PHONY: dc_logs
dc_logs: ## See the container’s logs
	$(DOCKER_COMPOSE) logs -f

##

.PHONY: docker_stop_all
docker_stop_all: confirm_continue ## Stop all running containers [y/N]
	docker stop $$(docker ps -a -q)

.PHONY: docker_remove_all
docker_remove_all: confirm_continue ## Remove all stopped containers [y/N]
	docker rm $$(docker ps -a -q)

## — PHP 🐘 ———————————————————————————————————————————————————————————————————

.PHONY: php
php: ## Run PHP. Pass the parameter with "p=" (example: make php p="--help")
	@$(eval p ?=)
	$(PHP) $(p)

.PHONY: php_sh
php_sh: ## Connect to the PHP container
	$(CONTAINER_PHP) sh

.PHONY: php_version
php_version: ## PHP version number
	$(PHP) -v

.PHONY: php_modules
php_modules: ## Show compiled in modules
	$(PHP) -m

## — UTILS 🛠️  —————————————————————————————————————————————————————————————————

.PHONY: vars
vars: ## Show variables
	@echo "COMPOSE_V1    : $(COMPOSE_V1)"
	@echo "COMPOSE_V2    : $(COMPOSE_V2)"
	@echo "LOCAL_PHP     : $(LOCAL_PHP)"
	@echo "DOCKER_COMPOSE: $(DOCKER_COMPOSE)"
	@echo "PHP           : $(PHP)"

.PHONY: colors
colors: ## Show colors
	@echo "Part of $(BLUE)the sentence in blue$(RESET), then reset."
	@echo "Part of $(GREEN)the sentence in green$(RESET), then reset."
	@echo "Part of $(RED)the sentence in red$(RESET), then reset."
	@echo "Part of $(YELLOW)the sentence in yellow$(RESET), then reset."
	@echo "Part of $(UNDERLINE)the sentence underlined$(RESET), then reset."

## — INTERNAL 🚧‍️ ——————————————————————————————————————————————————————————————

PHONY: confirm_continue
confirm_continue: ## Display a confirmation before continuing [y/N]
	@echo -n "$(GREEN)Do you want to continue?$(RESET) [$(YELLOW)y/N$(RESET)]: " && read answer && [ $${answer:-N} = y ]