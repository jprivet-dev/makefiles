# If you are importing a file, you need to adjust the help command a little.
# Use `target=command[2];` instead of `target=command[1];`.
-include .foo

## — 🎵 🐳 THE PROJECT MAKEFILE 🐳 🎵 —————————————————————————————————————————

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

## — GROUPE A 🚀 ——————————————————————————————————————————————————————————————

.PHONY: ga_command_1
ga_command_1: ga_command_2 ## Description of the "Groupe A: command 1"
	@echo "Groupe A: command 1"

.PHONY: ga_command_2
ga_command_2: ## Description of the "Groupe A: command 2"
	@echo "Groupe A: command 2"

##

.PHONY: ga_command_3
ga_command_3: ## Description of the "Groupe A: command 3"
	@echo "Groupe A: command 3"

.PHONY: ga_command_4
ga_command_4: ga_command_3 ## Description of the "Groupe A: command 4"
	@echo "Groupe A: command 4"

## — GROUPE B 🚧‍ ——————————————————————————————————————————————————————————————

.PHONY: gb_command_1
gb_command_1: gb_command_2 ## Description of the "Groupe B: command 1"
	@echo "Groupe B: command 1"

.PHONY: gb_command_2
gb_command_2: ## Description of the "Groupe B: command 2"
	@echo "Groupe B: command 2"

#
# INVISIBLE
#

.PHONY: invisible_command_1
invisible_command_1: invisible_command_2 # Description of the "Invisible command 1"
	@echo "Invisible command 1"

.PHONY: invisible_command_2
invisible_command_2:
	@echo "Invisible command 2"

