-include .foo

## — 🎵 🚀 THE PROJECT MAKEFILE 🚀 🎵 —————————————————————————————————————————

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

## — FOO 🚀 ———————————————————————————————————————————————————————————————————

foo_command_1 f1: foo_command_2 ## Short description for foo_command_1
	@printf "(foo_command_1)\n"

foo_command_2: ## Short description for foo_command_2
	@printf "(foo_command_2)\n"

##

foo_command_3 f3: ## Short description for foo_command_3
	@printf "(foo_command_3)\n"

foo_command_4: foo_command_3 ## Short description for foo_command_4
	@printf "(foo_command_4)\n"

## — BAR 🚧‍ ———————————————————————————————————————————————————————————————————

bar_command_1 b1: bar_command_2 ## Short description for bar_command_1
	@printf "(bar_command_1)\n"

bar_command_2: ## Short description for bar_command_2
	@printf "(bar_command_2)\n"

#
# INVISIBLE
#

invisible_command_1: invisible_command_2 # Short description for invisible_command_1
	@printf "(invisible_command_1)\n"

invisible_command_2:
	@printf "(invisible_command_2)\n"

