-include .foo

## — 🎵 🚀 THE PROJECT MAKEFILE 🚀 🎵 —————————————————————————————————————————

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

## — FOO 🚀 ———————————————————————————————————————————————————————————————————

.PHONY: foo_command_1 f1
foo_command_1 f1: foo_command_2 ## Short description for foo_command_1
	@printf "(foo_command_1)\n"

.PHONY: foo_command_2
foo_command_2: ## Short description for foo_command_2
	@printf "(foo_command_2)\n"

##

.PHONY: foo_command_3 f3
foo_command_3 f3: ## Short description for foo_command_3
	@printf "(foo_command_3)\n"

.PHONY: foo_command_4
foo_command_4: foo_command_3 ## Short description for foo_command_4
	@printf "(foo_command_4)\n"

## — BAR 🚧‍ ———————————————————————————————————————————————————————————————————

.PHONY: bar_command_1 b1
bar_command_1 b1: bar_command_2 ## Short description for bar_command_1
	@printf "(bar_command_1)\n"

.PHONY: bar_command_2
bar_command_2: ## Short description for bar_command_2
	@printf "(bar_command_2)\n"

#
# INVISIBLE
#

.PHONY: invisible_command_1
invisible_command_1: invisible_command_2 # Short description for invisible_command_1
	@printf "(invisible_command_1)\n"

.PHONY: invisible_command_2
invisible_command_2:
	@printf "(invisible_command_2)\n"

