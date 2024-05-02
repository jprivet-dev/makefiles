#
# SYMFONY ENVIRONMENT VARIABLES
#

# Files in order of increasing priority.
# @see https://github.com/jprivet-dev/makefiles/tree/main/symfony-env-include
# @see https://www.gnu.org/software/make/manual/html_node/Environment.html
# @see https://github.com/symfony/recipes/issues/18
# @see https://symfony.com/doc/current/quick_tour/the_architecture.html#environment-variables
# @see https://symfony.com/doc/current/configuration.html#listing-environment-variables
# @see https://symfony.com/doc/current/configuration.html#overriding-environment-values-via-env-local
include .env
-include .env.local

# get APP_ENV original value
FILE_ENV := $(APP_ENV)
-include .env.$(FILE_ENV)
-include .env.$(FILE_ENV).local

ifneq ($(FILE_ENV),$(APP_ENV))
$(info Warning: APP_ENV is overloaded outside .env and .env.local files)
endif

ifeq ($(FILE_ENV),prod)
$(info Warning: Your are in the prod environment)
else ifeq ($(FILE_ENV),test)
$(info Warning: Your are in the test environment)
endif

# @see https://symfony.com/doc/current/deployment.html#b-configure-your-environment-variables
ifneq ($(wildcard .env.local.php),)
$(info Warning: It is not possible to use variables from .env.local.php file)
$(info Warning: The final APP_ENV of that Makefile may be different from the APP_ENV of .env.local.php)
endif

#
# COLORS
#

RESET     = "\\033[0m"
BLUE      = "\\033[34m"
GREEN     = "\\033[32m"
RED       = "\\033[31m"
YELLOW    = "\\033[33m"
UNDERLINE = "\\033[4m"

## — 🎵 🛠️ THE SYMFONY ENV MAKEFILE 🛠️ 🎵 —————————————————————————————————————

# Print self-documented Makefile:
# $ make
# $ make help

.DEFAULT_GOAL = help
.PHONY: help
help: ## Print self-documented Makefile
	@grep -E '(^[.a-zA-Z_-]+[^:]+:.*##.*?$$)|(^#{2})' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = "## "}; \
		{ \
			split($$1, line, ":"); \
			# If you import a file in this Makefile (e.g.: include .env), line[1] is given the name of the current Makefile. \
			# You need to use targets=line[2] instead of targets=line[1]. \
			targets=line[2]; \
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

## — UTILS 🛠️  —————————————————————————————————————————————————————————————————

.PHONY: vars
vars: ## Show variables
	@echo "$(YELLOW)Vars:$(RESET)"
	@echo "APP_ENV   : $(APP_ENV)"
	@echo "APP_SECRET: $(APP_SECRET)"

.PHONY: env_files
env_files: ## Show env files loaded into that Makefile
	@echo "$(YELLOW)Env files loaded into that Makefile (in order of decreasing priority) [FILE_ENV=$(FILE_ENV)]:$(RESET)"
ifneq ("$(wildcard .env.$(FILE_ENV).local)","")
	@echo "* $(GREEN)✓$(RESET) .env.$(FILE_ENV).local"
else
	@echo "* $(RED)⨯$(RESET) .env.$(FILE_ENV).local"
endif
ifneq ("$(wildcard .env.$(FILE_ENV))","")
	@echo "* $(GREEN)✓$(RESET) .env.$(FILE_ENV)"
else
	@echo "* $(RED)⨯$(RESET) .env.$(FILE_ENV)"
endif
ifneq ("$(wildcard .env.local)","")
	@echo "* $(GREEN)✓$(RESET) .env.local"
else
	@echo "* $(RED)⨯$(RESET) .env.local"
endif
ifneq ("$(wildcard .env)","")
	@echo "* $(GREEN)✓$(RESET) .env"
else
	@echo "* $(RED)⨯$(RESET) .env"
endif