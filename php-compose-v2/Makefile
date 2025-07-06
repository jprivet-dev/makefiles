#
# COLORS
#

# (G)REEN, (R)ED, (Y)ELLOW & RE(S)ET
G = "\\033[32m"
R = "\\033[31m"
Y = "\\033[33m"
S = "\\033[0m"

#
# DOCKER
#

COMPOSE_V2 := $(shell docker compose version 2> /dev/null)

ifndef COMPOSE_V2
$(error Docker Compose CLI plugin is required but is not available on your system)
endif

COMPOSE       = docker compose
EXEC          = $(COMPOSE) exec
CONTAINER_PHP = $(EXEC) php
PHP           = $(CONTAINER_PHP) php

## — 🎵 🐘 THE PHP DOCKER MAKEFILE 🐘 🎵 ——————————————————————————————————————

# Print self-documented Makefile:
# $ make
# $ make help

.DEFAULT_GOAL = help
.PHONY: help
help: ## Display this help message with available commands
	@grep -E '(^[.a-zA-Z_-]+[^:]+:.*##.*?$$)|(^#{2})' Makefile | awk 'BEGIN {FS = "## "}; { \
		split($$1, line, ":"); targets=line[1]; description=$$2; \
		if (targets == "##") { printf "\033[33m%s\n", ""; } \
		else if (targets == "" && description != "") { printf "\033[33m\n%s\n", description; } \
		else if (targets != "" && description != "") { split(targets, parts, " "); target=parts[1]; alias=parts[2]; printf "\033[32m  %-26s \033[34m%-2s \033[0m%s\n", target, alias, description; } \
	}'
	@echo

## — PROJECT 🚀 ———————————————————————————————————————————————————————————————

.PHONY: start
start: up_d vars info ## Start the project (implies detached mode)

.PHONY: stop
stop: down ## Stop the project

.PHONY: info
info: ## Show info
	@printf "\n$(Y)Info$(S)"
	@printf "\n$(Y)----$(S)\n\n"
	@printf "Go on $(G)http://0.0.0.0:8000/$(S)\n"
	@printf "\n"

## — PHP 🐘 ———————————————————————————————————————————————————————————————————

.PHONY: php
php: ## Run PHP - $ make php [ARG=<arguments>] - Example: $ make php ARG=-v
	$(PHP) $(ARG)

php_sh: ## Connect to the PHP container
	$(CONTAINER_PHP) sh

php_modules: ## Show compiled in modules
	$(PHP) -m

## — DOCKER 🐳 ————————————————————————————————————————————————————————————————

.PHONY: up
up: ## Start the container - $ make up [ARG=<arguments>] - Example: $ make up ARG=-d
	$(COMPOSE) up --remove-orphans $(ARG)

up_d: ## Start the container (wait for services to be running|healthy - detached mode)
	$(MAKE) up ARG="--wait -d"

.PHONY: down
down: ## Stop the container
	$(COMPOSE) down --remove-orphans

.PHONY: build
build: ## Build or rebuild services
	$(COMPOSE) build --pull

.PHONY: logs
logs: ## See the container’s logs
	$(COMPOSE) logs -f

.PHONY: config
config: ## Parse, resolve and render compose file in canonical format
	$(COMPOSE) config

##

docker_stop_all: confirm ## Stop all running containers [y/N]
	docker stop $$(docker ps -a -q)

docker_remove_all: confirm ## Remove all stopped containers [y/N]
	docker rm $$(docker ps -a -q)

## — UTILS 🛠️  —————————————————————————————————————————————————————————————————

.PHONY: vars
vars: ## Show some Makefile variables
	@printf "\n$(Y)Vars$(S)"
	@printf "\n$(Y)----$(S)\n"
	@printf "\n$(G)DOCKER$(S)\n"
	@printf "COMPOSE_V2   : $(COMPOSE_V2)\n"
	@printf "COMPOSE      : $(COMPOSE)\n"
	@printf "EXEC         : $(EXEC)\n"
	@printf "CONTAINER_PHP: $(CONTAINER_PHP)\n"
	@printf "PHP          : $(PHP)\n"

## — INTERNAL 🚧‍️ ——————————————————————————————————————————————————————————————

PHONY: confirm
confirm: ## Display a confirmation before continuing [y/N]
	@if [ "$${NO_INTERACTION}" = "true" ]; then exit 0; fi; \
	printf "$(G)Do you want to continue?$(S) [$(Y)y/N$(S)]: " && read answer && [ $${answer:-N} = y ]
