#
# COLORS
#

RESET     = "\\033[0m"
BLUE      = "\\033[34m"
GREEN     = "\\033[32m"
RED       = "\\033[31m"
YELLOW    = "\\033[33m"
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

## — UTILS 🛠️  —————————————————————————————————————————————————————————————————

.PHONY: colors
colors: ## Show colors
	@echo "Part of $(BLUE)the sentence in blue$(RESET), then reset."
	@echo "Part of $(GREEN)the sentence in green$(RESET), then reset."
	@echo "Part of $(RED)the sentence in red$(RESET), then reset."
	@echo "Part of $(YELLOW)the sentence in yellow$(RESET), then reset."
	@echo "Part of $(UNDERLINE)the sentence underlined$(RESET), then reset."