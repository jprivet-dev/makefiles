#
# COLORS
#

B = "\\033[34m" # BLUE
G = "\\033[32m" # GREEN
R = "\\033[31m" # RED
Y = "\\033[33m" # YELLOW
S = "\\033[0m"  # RESET

#
# EXECUTABLES (LOCAL)
#

GH_VERSION := $(shell gh version 2> /dev/null)

ifndef GH_VERSION
$(error GitHub CLI is required but is not available on your system)
endif

GIT_VERSION := $(shell git version 2> /dev/null)

ifndef GIT_VERSION
$(error Git is required but is not available on your system)
endif

## — 👾 🐙 THE GITHUB CLI & GIT MAKEFILE 🐙 👾 ————————————————————————————————

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

## — PROJECT 🚀 ———————————————————————————————————————————————————————————————

.PHONY: versions
versions: gh_version git_version ## Display all versions of the libraries used in this Makefile

## — GITHUB CLI 👾 ————————————————————————————————————————————————————————————

.PHONY: gh_version
gh_version: ## GitHub CLI version
	gh version

## — GIT 🐙 ———————————————————————————————————————————————————————————————————

.PHONY: git_version
git_version: ## Git version
	git version

.PHONY: git_main
git_main: ## Show the name of the main branch
	@printf "$(Y)'$(shell basename $(shell git symbolic-ref --short refs/remotes/origin/HEAD))' is the main branch.$(S)\n"

.PHONY: git_current
git_current: ## Show the current branch
	@printf "$(Y)'$(shell git rev-parse --abbrev-ref HEAD)' is the current branch.$(S)\n"

.PHONY: git_exists
git_exists: ## Check if a branch exists - $ make git_exists branch=<branch>
	@$(if $(branch),, $(error branch argument is required))
ifeq ($(shell git rev-parse --verify $(branch) 2>/dev/null),)
	@printf "$(R)⨯$(S) The $(branch) branch does not exist.\n"
else
	@printf "$(G)✓$(S) The $(branch) branch exists.\n"
endif

##

.PHONY: git_hooks_on
git_hooks_on: .git ## Use the hooks directory of this project
	git config core.hooksPath hooks/
	sudo chmod +x hooks/* # 755

.PHONY: git_hooks_off
git_hooks_off: ## Use the default hooks directory of Git
	git config --unset core.hooksPath
	sudo chmod 644 hooks/*

.PHONY: git_hooks_pre_commit
git_hooks_pre_commit: ## Actions on pre-commit
	@printf "$(Y)Actions on pre-commit.\n$(S)"

.PHONY: git_hooks_pre_push
git_hooks_pre_push: ## Actions on pre-push
	@printf "$(Y)Actions on pre-push.\n$(S)"

## — INTERNAL 🚧‍️ ——————————————————————————————————————————————————————————————

# Pending...

.PHONY: __git_exists_bis
__git_exists_bis: # TODO: Works very well, with a default value
	@branch=$${branch:-"main"}; exists=$$(git rev-parse --verify $${branch} 2>/dev/null); \
	[ "$${exists}" = "" ] \
		&& printf "$(R)⨯$(S) The $${branch} branch does not exist.\n" \
		|| printf "$(G)✓$(S) The $${branch} branch exists.\n";

.PHONY: _git_exists_ko
_git_exists_ko: # TODO: Do not work. The `main` default value is not returned in the `git rev-parse` command and the `ifeq` condition
	@$(eval branch ?= main)
ifeq ($(shell git rev-parse --verify $(branch) 2>/dev/null),)
	@printf "$(R)⨯$(S) The $(branch) branch does not exist.\n"
else
	@printf "$(G)✓$(S) The $(branch) branch exists.\n"
endif

