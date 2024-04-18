# If you are importing a file, you need to adjust the help command a little.
# Use `target=command[2];` instead of `target=command[1];`.
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
			split($$1, command, ":"); \
			target=command[2]; \
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

## — FOO 🚀 ———————————————————————————————————————————————————————————————————

.PHONY: foo_command_1
foo_command_1: foo_command_2 ## Short description for foo_command_1
	@echo "Foo: command 1"

.PHONY: foo_command_2
foo_command_2: ## Short description for foo_command_2
	@echo "Foo: command 2"

##

.PHONY: foo_command_3
foo_command_3: ## Short description for foo_command_3
	@echo "Foo: command 3"

.PHONY: foo_command_4
foo_command_4: foo_command_3 ## Short description for foo_command_4
	@echo "Foo: command 4"

## — BAR 🚧‍ ———————————————————————————————————————————————————————————————————

.PHONY: bar_command_1
bar_command_1: bar_command_2 ## Short description for bar_command_1
	@echo "Bar: command 1"

.PHONY: bar_command_2
bar_command_2: ## Short description for bar_command_2
	@echo "Bar: command 2"

#
# INVISIBLE
#

.PHONY: invisible_command_1
invisible_command_1: invisible_command_2 # Short description for invisible_command_1
	@echo "Invisible command 1"

.PHONY: invisible_command_2
invisible_command_2:
	@echo "Invisible command 2"

