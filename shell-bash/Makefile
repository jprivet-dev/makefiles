# @see https://stackoverflow.com/questions/589276/how-can-i-use-bash-syntax-in-makefile-targets
# @see https://www.gnu.org/software/make/manual/html_node/Choosing-the-Shell.html
SHELL:=/bin/bash

#
# COLORS
#

RESET     = "\\033[0m"
BLUE      = "\\033[34m"
GREEN     = "\\033[32m"
RED       = "\\033[31m"
YELLOW    = "\\033[33m"
UNDERLINE = "\\033[4m"

## — 🎵 🚀 THE SHELL BASH MAKEFILE 🚀 🎵 ——————————————————————————————————————

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
			if (line[1] == "Makefile") { \
				# If you import a file in this Makefile (e.g.: include .env), line[1] is given the name of the current Makefile. \
				# You need to use targets=line[2] instead of targets=line[1]. \
				targets=line[2]; \
			} else { \
				targets=line[1]; \
			} \
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

## — HELLO 🖖 —————————————————————————————————————————————————————————————————

.PHONY: hello_1
hello_1: ## Arguments: name. Example: $ make hello_1 name=Michel
	@[ "$(name)" == "" ] && echo -e "$(BLUE)(1) Hello World!$(RESET)" || echo -e "$(YELLOW)(1) Hello $(name)!$(RESET)"

.PHONY: hello_2
hello_2: ## Arguments: name. Example: $ make hello_2 name=Michel
	@if [ "$(name)" == "" ]; \
	then \
		echo -e "$(BLUE)(2) Hello World!$(RESET)"; \
	else \
		echo -e "$(YELLOW)(2) Hello $(name)!$(RESET)"; \
	fi

.PHONY: hello_3
hello_3: ## Arguments: name. Example: $ make hello_3 name=Michel
	@$(eval name ?= World)
	@echo -e "$(GREEN)(3) Hello $(name)!$(RESET)"

