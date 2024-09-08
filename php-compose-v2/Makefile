#
# COLORS
#

RESET     = "\\033[0m"
BLUE      = "\\033[34m"
GREEN     = "\\033[32m"
RED       = "\\033[31m"
YELLOW    = "\\033[33m"
UNDERLINE = "\\033[4m"

#
# EXECUTABLES (LOCAL)
#

COMPOSE_V2 := $(shell docker compose version 2> /dev/null)

ifndef COMPOSE_V2
$(error Docker Compose CLI plugin is required but is not available on your system)
endif

EXEC          = docker compose exec
CONTAINER_PHP = $(EXEC) php
PHP           = $(CONTAINER_PHP) php

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
	@printf "Go on $(GREEN)http://0.0.0.0:8000/$(RESET)\n"

## — DOCKER 🐳 ————————————————————————————————————————————————————————————————

.PHONY: up
up: ## Start the container
	docker compose up

.PHONY: up_d
up_d: ## Start the container (wait for services to be running|healthy - detached mode)
	docker compose up --remove-orphans --wait

.PHONY: down
down: ## Stop the container
	docker compose down

.PHONY: build
build: ## Build or rebuild services
	docker compose build

.PHONY: logs
logs: ## See the container’s logs
	docker compose logs -f

##

.PHONY: docker_stop_all
docker_stop_all: confirm_continue ## Stop all running containers [y/N]
	docker stop $$(docker ps -a -q)

.PHONY: docker_remove_all
docker_remove_all: confirm_continue ## Remove all stopped containers [y/N]
	docker rm $$(docker ps -a -q)

## — UTILS 🛠️  —————————————————————————————————————————————————————————————————

.PHONY: vars
vars: ## Show variables
	@printf "$(YELLOW)Vars:$(RESET)\n"
	@printf "COMPOSE_V2   : $(COMPOSE_V2)\n"
	@printf "EXEC         : $(EXEC)\n"
	@printf "CONTAINER_PHP: $(CONTAINER_PHP)\n"
	@printf "PHP          : $(PHP)\n"

## — INTERNAL 🚧‍️ ——————————————————————————————————————————————————————————————

PHONY: confirm_continue
confirm_continue: ## Display a confirmation before continuing [y/N]
	@$(eval yes_by_default ?=) # Default ‘yes’ answer
	@if [ "$${yes_by_default}" == "true" ]; then exit 0; fi; \
	printf "$(GREEN)Do you want to continue?$(RESET) [$(YELLOW)y/N$(RESET)]: " && read answer && [ $${answer:-N} = y ]
