# See https://stackoverflow.com/questions/589276/how-can-i-use-bash-syntax-in-makefile-targets
# See https://www.gnu.org/software/make/manual/html_node/Choosing-the-Shell.html
SHELL:=/bin/bash

#
# COLORS
#

# (G)REEN, (R)ED, (Y)ELLOW & RE(S)ET
G = "\\033[32m"
R = "\\033[31m"
Y = "\\033[33m"
S = "\\033[0m"

## — 🎵 🚀 THE SHELL BASH MAKEFILE 🚀 🎵 ——————————————————————————————————————

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

## — HELLO 🖖 —————————————————————————————————————————————————————————————————

hello_1: ## $ make hello_1 [name=<name>]
	@[ "$(name)" == "" ] && printf "$(B)(1) Hello World!$(S)\n" || printf "$(Y)(1) Hello $(name)!$(S)\n"

hello_2: ## $ make hello_2 [name=<name>]
	@if [ "$(name)" == "" ]; \
	then \
		printf "$(B)(2) Hello World!$(S)\n"; \
	else \
		printf "$(Y)(2) Hello $(name)!$(S)\n"; \
	fi

hello_3: ## $ make hello_3 [name=<name>]
	@$(eval name ?= World)
	@printf "$(G)(3) Hello $(name)!$(S)\n"

## — UTILS 🛠️  —————————————————————————————————————————————————————————————————

.PHONY: shell
shell: ## Show the program used as the shell in that Makefile
	@printf "SHELL: $(G)$(SHELL)$(S)\n"
