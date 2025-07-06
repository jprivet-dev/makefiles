#
# COLORS
#

# (G)REEN, (R)ED, (Y)ELLOW & RE(S)ET
G = "\\033[32m"
R = "\\033[31m"
Y = "\\033[33m"
S = "\\033[0m"

#
# SYMFONY ENVIRONMENT VARIABLES
#

# Files in order of increasing priority.
# See https://github.com/jprivet-dev/makefiles/tree/main/symfony-env-include
# See https://www.gnu.org/software/make/manual/html_node/Environment.html
# See https://github.com/symfony/recipes/issues/18
# See https://symfony.com/doc/current/quick_tour/the_architecture.html#environment-variables
# See https://symfony.com/doc/current/configuration.html#listing-environment-variables
# See https://symfony.com/doc/current/configuration.html#overriding-environment-values-via-env-local
include .env
-include .env.local
-include .env.$(APP_ENV)
-include .env.$(APP_ENV).local

ifeq ($(APP_ENV),prod)
$(info Warning: Your are in the prod environment)
endif

# See https://symfony.com/doc/current/deployment.html#b-configure-your-environment-variables
ifneq ($(wildcard .env.local.php),)
$(info Warning: It is not possible to use variables from .env.local.php file)
endif

## — 🎵 🛠️  THE SYMFONY ENV MAKEFILE 🛠️  🎵 —————————————————————————————————————

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

## — 🐳 🎵 THE SYMFONY STARTER MAKEFILE 🎵 🐳 —————————————————————————————————

PHONY: info
info: env_files vars## Show info

## — UTILS 🛠️  —————————————————————————————————————————————————————————————————

env_files: ## Show env files loaded into that Makefile
	@printf "\n$(Y)Symfony env files$(S)"
	@printf "\n$(Y)-----------------$(S)\n\n"
	@printf "Files loaded into that Makefile (in order of decreasing priority) $(Y)[APP_ENV=$(APP_ENV)]$(S):\n\n"
ifneq ("$(wildcard .env.$(APP_ENV).local)","")
	@printf "* $(G)✔$(S) .env.$(APP_ENV).local\n"
else
	@printf "* $(R)⨯$(S) .env.$(APP_ENV).local\n"
endif
ifneq ("$(wildcard .env.$(APP_ENV))","")
	@printf "* $(G)✔$(S) .env.$(APP_ENV)\n"
else
	@printf "* $(R)⨯$(S) .env.$(APP_ENV)\n"
endif
ifneq ("$(wildcard .env.local)","")
	@printf "* $(G)✔$(S) .env.local\n"
else
	@printf "* $(R)⨯$(S) .env.local\n"
endif
ifneq ("$(wildcard .env)","")
	@printf "* $(G)✔$(S) .env\n"
else
	@printf "* $(R)⨯$(S) .env\n"
endif

.PHONY: vars
vars: ## Show some Makefile variables
	@printf "\n$(Y)Vars$(S)"
	@printf "\n$(Y)----$(S)\n"
	@printf "APP_ENV   : $(APP_ENV)\n"
	@printf "APP_SECRET: $(APP_SECRET)\n"
