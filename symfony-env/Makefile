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

## — UTILS 🛠️  —————————————————————————————————————————————————————————————————

.PHONY: app
app: ## Show APP_XX variables
	@echo "APP_ENV: $(APP_ENV)"
	@echo "APP_SECRET: $(APP_SECRET)"

.DEFAULT_GOAL = vars
.PHONY: vars
# @see https://stackoverflow.com/questions/7117978/gnu-make-list-the-values-of-all-variables-or-macros-in-a-particular-run
vars: ## Show variables (exclude built-in variables)
		$(foreach v, \
			$(shell echo "$(filter-out $(BUILT_IN_VARS) BUILT_IN_VARS, $(.VARIABLES))" | tr ' ' '\n' | sort), \
			$(info $(shell printf "%-20s" "$(v)")= $(value $(v))) \
		)