#
# COLORS
#

# (G)REEN, (R)ED, (Y)ELLOW & RE(S)ET
G = "\\033[32m"
R = "\\033[31m"
Y = "\\033[33m"
S = "\\033[0m"

## — 🎵 🚀 THE PROJECT MAKEFILE 🚀 🎵 —————————————————————————————————————————

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

## — VARIOUS 🚀 ———————————————————————————————————————————————————————————————

.PHONY: generate ge
generate ge: confirm ## Generate a file with date [y/N]
	@now=$$(date +%Y%m%d-%H%M%S) \
		&& file=my-file-$${now}.txt \
        && printf "Generate $(Y)$${file}$(S)\n" \
	    && touch $${file}

.PHONY: remove rm
remove rm: confirm ## Remove all generated files with date [y/N]
	rm my-file*.txt

## — INTERNAL 🚧‍️ ——————————————————————————————————————————————————————————————

PHONY: confirm
confirm: ## Display a confirmation before continuing [y/N]
	@if [ "$${NO_INTERACTION}" = "true" ]; then exit 0; fi; \
	printf "$(G)Do you want to continue?$(S) [$(Y)y/N$(S)]: " && read answer && [ $${answer:-N} = y ]