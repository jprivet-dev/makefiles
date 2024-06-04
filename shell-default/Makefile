#
# COLORS
#

RESET     = "\\033[0m"
BLUE      = "\\033[34m"
GREEN     = "\\033[32m"
RED       = "\\033[31m"
YELLOW    = "\\033[33m"
UNDERLINE = "\\033[4m"

## — 🎵 🚀 THE SHELL DEFAULT MAKEFILE 🚀 🎵 ———————————————————————————————————

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

## — HELLO 🖖 —————————————————————————————————————————————————————————————————

.PHONY: hello_1
hello_1: ## $ make hello_1 [name=<name>]
	@[ "$(name)" = "" ] && printf "$(BLUE)(1) Hello World!$(RESET)\n" || printf "$(YELLOW)(1) Hello $(name)!$(RESET)\n"

.PHONY: hello_2
hello_2: ## make hello_2 [name=<name>]
	@if [ "$(name)" = "" ]; \
	then \
		printf "$(BLUE)(2) Hello World!$(RESET)\n"; \
	else \
		printf "$(YELLOW)(2) Hello $(name)!$(RESET)\n"; \
	fi

.PHONY: hello_3
hello_3: ## $ make hello_3 [name=<name>]
	@name=$${name:-"World"}; \
	printf "$(GREEN)(3) Hello $${name}!$(RESET)\n"

.PHONY: hello_4
# @see https://www.gnu.org/software/make/manual/html_node/Conditional-Functions.html
hello_4: ## $ make hello_4 [name=<name>]
	@$(if $(name), printf "$(YELLOW)(4) Hello $(name)!$(RESET)\n", printf "$(BLUE)(4) Hello World!$(RESET)\n")

.PHONY: hello_5
hello_5: ## $ make hello_5 [name=<name>]
ifeq ($(name),)
	@printf "$(BLUE)(5) Hello World!$(RESET)\n"
else
	@printf "$(YELLOW)(5) Hello $(name)!$(RESET)\n"
endif

.PHONY: hello_6
hello_6: ## $ make hello_6 [name=<name>]
	@$(eval name ?= World)
	@printf "$(GREEN)(6) Hello $(name)!$(RESET)\n"

## — UTILS 🛠️  —————————————————————————————————————————————————————————————————

.PHONY: shell
shell: ## Show the program used as the shell in that Makefile
	@printf "SHELL: $(GREEN)$(SHELL)$(RESET)\n"

