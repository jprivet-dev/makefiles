BUILT_IN_VARS := $(.VARIABLES)

#
# SYMFONY ENVIRONMENT VARIABLES
#

# Files in order of increasing priority.
# @see https://www.gnu.org/software/make/manual/html_node/Environment.html
# @see https://github.com/symfony/recipes/issues/18
# @see https://symfony.com/doc/current/quick_tour/the_architecture.html#environment-variables
# @see https://symfony.com/doc/current/configuration.html#listing-environment-variables
include .env
-include .env.local
-include .env.dev
-include .env.dev.local

# For ease of reading, clearly indicate the symfony environment variables you need in this makefile.
APP_ENV ?= undefined
APP_SECRET ?= undefined
APP_FOO ?= undefined
APP_BAR ?= undefined

#
# OTHER VARIABLES
#

FOO = foo
BAR = bar
BAZ = $(FOO) bis

## — 🎵 🛠️ THE ENV MAKEFILE 🛠️ 🎵 —————————————————————————————————————————————

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

## — UTILS 🛠️  —————————————————————————————————————————————————————————————————

.PHONY: app
app: ## Show APP_XX variables
	@echo "APP_ENV: $(APP_ENV)"
	@echo "APP_SECRET: $(APP_SECRET)"

.PHONY: vars
# @see https://stackoverflow.com/questions/7117978/gnu-make-list-the-values-of-all-variables-or-macros-in-a-particular-run
vars: ## Show variables (exclude built-in variables)
		$(foreach v, \
			$(shell echo "$(filter-out $(BUILT_IN_VARS) BUILT_IN_VARS, $(.VARIABLES))" | tr ' ' '\n' | sort), \
			$(info $(shell printf "%-20s" "$(v)")= $(value $(v))) \
		)