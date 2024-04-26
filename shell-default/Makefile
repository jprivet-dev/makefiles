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

## — HELLO 🖖 —————————————————————————————————————————————————————————————————

.PHONY: hello_1
hello_1: ## Pass the name with "name=" (example: make hello_1 name=Michel)
	@[ "$(name)" = "" ] && echo "$(BLUE)(1) Hello World!$(RESET)" || echo "$(YELLOW)(1) Hello $(name)!$(RESET)"

.PHONY: hello_2
hello_2: ## Pass the name with "name=" (example: make hello_2 name=Michel)
	@if [ "$(name)" = "" ]; \
	then \
		echo "$(BLUE)(2) Hello World!$(RESET)"; \
	else \
		echo "$(YELLOW)(2) Hello $(name)!$(RESET)"; \
	fi

.PHONY: hello_3
hello_3: ## Pass the name with "name=" (example: make hello_3 name=Michel)
	@name=$${name:-"World"}; \
	echo "$(GREEN)(3) Hello $${name}!$(RESET)"

.PHONY: hello_4
# @see https://www.gnu.org/software/make/manual/html_node/Conditional-Functions.html
hello_4: ## Pass the name with "name=" (example: make hello_4 name=Michel)
	@$(if $(name), echo "$(YELLOW)(4) Hello $(name)!$(RESET)", echo "$(BLUE)(4) Hello World!$(RESET)")

.PHONY: hello_5
hello_5: ## Pass the name with "name=" (example: make hello_5 name=Michel)
ifeq ($(name),)
	@echo "$(BLUE)(5) Hello World!$(RESET)"
else
	@echo "$(YELLOW)(5) Hello $(name)!$(RESET)"
endif

.PHONY: hello_6
hello_6: ## Pass the name with "name=" (example: make hello_6 name=Michel)
	@$(eval name ?= World)
	@echo "$(GREEN)(6) Hello $(name)!$(RESET)"


