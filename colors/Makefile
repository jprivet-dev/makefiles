#
# Colors
#

RESET = "\\033[0m"
BLUE = "\\033[34m"
GREEN = "\\033[32m"
RED = "\\033[31m"
YELLOW = "\\033[33m"
UNDERLINE = "\\033[4m"

## — 🎵 🖌️  THE COLOR MAKEFILE 🖌️  🎵 ———————————————————————————————————————————

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

## — UTILS 🛠️  —————————————————————————————————————————————————————————————————

.PHONY: colors
colors: ## Show colors
	@echo "Part of $(BLUE)the sentence in blue$(RESET), then reset."
	@echo "Part of $(GREEN)the sentence in green$(RESET), then reset."
	@echo "Part of $(RED)the sentence in red$(RESET), then reset."
	@echo "Part of $(YELLOW)the sentence in yellow$(RESET), then reset."
	@echo "Part of $(UNDERLINE)the sentence underlined$(RESET), then reset."