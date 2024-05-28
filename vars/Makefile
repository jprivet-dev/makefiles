BUILT_IN_VARS := $(.VARIABLES)

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
# OTHER VARIABLES
#

FOO = foo
BAR = bar
BAZ = $(FOO) bis

## — 🎵 🛠️  THE VARS MAKEFILE 🛠️  🎵 ————————————————————————————————————————————

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

## — UTILS 🛠️  —————————————————————————————————————————————————————————————————

.PHONY: vars
# @see https://stackoverflow.com/questions/7117978/gnu-make-list-the-values-of-all-variables-or-macros-in-a-particular-run
vars: ## Show variables (exclude built-in variables)
	$(foreach v, \
		$(shell printf "$(filter-out $(BUILT_IN_VARS) BUILT_IN_VARS, $(.VARIABLES))" | tr ' ' '\n' | sort), \
		$(info $(shell printf "%-20s" "$(v)")= $(value $(v))) \
	)