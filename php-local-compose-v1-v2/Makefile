#
# COLORS
#

B = "\\033[34m" # BLUE
G = "\\033[32m" # GREEN
R = "\\033[31m" # RED
Y = "\\033[33m" # YELLOW
S = "\\033[0m"  # RESET

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
	EXEC          = $(DOCKER_COMPOSE) exec
	CONTAINER_PHP = $(EXEC) php
else ifndef LOCAL_PHP
$(error No dockerized or local PHP interpreter)
endif

PHP = $(CONTAINER_PHP) php

## — 🎵 🐘 THE PHP DOCKER MAKEFILE 🐘 🎵 ——————————————————————————————————————

# Print self-documented Makefile:
# $ make
# $ make help

.DEFAULT_GOAL = help
.PHONY: help
help: ## Print self-documented Makefile
	@grep -E '(^[.a-zA-Z_-]+[^:]+:.*##.*?$$)|(^#{2})' Makefile \
	| awk 'BEGIN {FS = "## "}; \
		{ \
			split($$1, line, ":"); \
			targets=line[1]; \
			description=$$2; \
			if (targets == "##") { \
				# --- space --- \
				printf "\033[33m%s\n", ""; \
			} else if (targets == "" && description != "") { \
				# --- title --- \
				printf "\033[33m\n%s\n", description; \
			} else if (targets != "" && description != "") { \
				# --- target, alias, description --- \
				split(targets, parts, " "); \
				target=parts[1]; \
				alias=parts[2]; \
				printf "\033[32m  %-26s \033[34m%-2s \033[0m%s\n", target, alias, description; \
			} \
		}'
	@echo

## — PROJECT 🚀 ———————————————————————————————————————————————————————————————

.PHONY: start
start: up_d info ## Start the project (implies detached mode)

.PHONY: stop
stop: down ## Stop the project

.PHONY: info
info: ## Show info
	@printf "Go on $(G)http://0.0.0.0:8000/$(S)\n"

## — DOCKER 🐳 ————————————————————————————————————————————————————————————————

.PHONY: up
up: ## Start the container
	$(DOCKER_COMPOSE) up

.PHONY: up_d
up_d: ## Start the container (wait for services to be running|healthy - detached mode)
	$(DOCKER_COMPOSE) up --remove-orphans --wait

.PHONY: down
down: ## Stop the container
	$(DOCKER_COMPOSE) down

.PHONY: build
build: ## Build or rebuild services
	$(DOCKER_COMPOSE) build

.PHONY: logs
logs: ## See the container’s logs
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
php: ## Run PHP - $ make php [p=<params>]
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
	@printf "$(Y)Vars:$(S)\n"
	@printf "COMPOSE_V1    : $(COMPOSE_V1)\n"
	@printf "COMPOSE_V2    : $(COMPOSE_V2)\n"
	@printf "LOCAL_PHP     : $(LOCAL_PHP)\n"
	@printf "EXEC          : $(EXEC)\n"
	@printf "DOCKER_COMPOSE: $(DOCKER_COMPOSE)\n"
	@printf "PHP           : $(PHP)\n"

## — INTERNAL 🚧‍️ ——————————————————————————————————————————————————————————————

PHONY: confirm_continue
confirm_continue: ## Display a confirmation before continuing [y/N]
	@$(eval yes_by_default ?=) # Default ‘yes’ answer
	@if [ "$${yes_by_default}" = "true" ]; then exit 0; fi; \
	printf "$(G)Do you want to continue?$(S) [$(Y)y/N$(S)]: " && read answer && [ $${answer:-N} = y ]
