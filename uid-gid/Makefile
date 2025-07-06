## — 🎵 🚀 UID & GID 🚀 🎵 ————————————————————————————————————————————————————

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

## — UTILS 🛠️  —————————————————————————————————————————————————————————————————

.PHONY: id
id: ## Show UID & GID
	@printf "UID: $(shell id -u) - GID: $(shell id -g)\n"

id_bis: ## Show UID & GID (see https://askubuntu.com/questions/1124674/why-is-my-gid-environment-variable-empty)
	@printf "UID: $(shell echo $$UID) - GID: $(shell echo $$GID)\n"
