#
# COLORS
#

# (B)LUE, (G)REEN, (R)ED, (Y)ELLOW & RE(S)ET
B = "\\033[34m"
G = "\\033[32m"
R = "\\033[31m"
Y = "\\033[33m"
S = "\\033[0m"

## — 🎵 🖌️  THE COLOR MAKEFILE 🖌️  🎵 ———————————————————————————————————————————

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

## — UTILS 🛠️  —————————————————————————————————————————————————————————————————

.PHONY: colors
colors: ## Show colors
	@printf "Part of $(B)the sentence in blue$(S), then reset.\n"
	@printf "Part of $(G)the sentence in green$(S), then reset.\n"
	@printf "Part of $(R)the sentence in red$(S), then reset.\n"
	@printf "Part of $(Y)the sentence in yellow$(S), then reset.\n"
