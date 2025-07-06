#
# COLORS
#

# (G)REEN, (R)ED, (Y)ELLOW & RE(S)ET
G = "\\033[32m"
R = "\\033[31m"
Y = "\\033[33m"
S = "\\033[0m"

## — 👾 🚀 THE ALIASES MAKEFILE 🚀 👾 —————————————————————————————————————————

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

.PHONY: info
info: ## Show info
	@printf "\n$(Y)Info$(S)"
	@printf "\n$(Y)----$(S)\n\n"
	@printf "Load aliases : $(Y)$$ . aliases$(S)\n"
	@printf "\n"

.PHONY: foo
foo: ## Foo - $ make foo [ARG=<arguments>]
	@printf "Foo with arguments ($(ARG))\n"

.PHONY: bar
bar: ## Bar - $ make bar [ARG=<arguments>]
	@printf "Bar with arguments ($(ARG))\n"

## — UTILITIES 🛠️ ——————————————————————————————————————————————————————————————

.PHONY: aliases
aliases: ## Load project aliases (e.g., . aliases)
	@printf "To load aliases, run:\n   $(Y). aliases$(S)\nor:\n  $(Y)console aliases$(S)\n";
