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

#
# COLORS
#

RESET     = "\\033[0m"
BLUE      = "\\033[34m"
GREEN     = "\\033[32m"
RED       = "\\033[31m"
YELLOW    = "\\033[33m"
UNDERLINE = "\\033[4m"

## — 👾 🐙 THE GITHUB CLI & GIT MAKEFILE 🐙 👾 ————————————————————————————————

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

## — PROJECT 🚀 ———————————————————————————————————————————————————————————————

.PHONY: versions
versions: gh_version git_version ## Display all versions of the libraries used in this Makefile

.PHONY: action_if_branch_exists
action_if_branch_exists: git_exists ## Display all versions of the libraries used in this Makefile
		echo "$(GREEN)Action done.$(RESET)"


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
	@echo "$(YELLOW)'$(shell basename $(shell git symbolic-ref --short refs/remotes/origin/HEAD))' is the main branch.$(RESET)"

.PHONY: git_current
git_current: ## Show the current branch
	@echo "$(YELLOW)'$(shell git rev-parse --abbrev-ref HEAD)' is the current branch.$(RESET)"

.PHONY: git_exists
git_exists: ## Check if a branch exists. Pass the branch with "branch=" (example: make git_exists branch=main)
	@$(if $(branch),, $(error branch argument is required))
ifeq ($(shell git rev-parse --verify $(branch) 2>/dev/null),)
	@echo "$(RED)⨯$(RESET) The $(branch) branch does not exist."
else
	@echo "$(GREEN)✓$(RESET) The $(branch) branch exists."
endif

.PHONY: hello_3
hello_3: ## Pass the name with "name=" (example: make hello_3 name=Michel)
	@name=$${name:-"World"}; \
	echo "$(GREEN)(3) Hello $${name}!$(RESET)"


# Pending...

.PHONY: __git_exists
__git_exists: # TODO: Do not work. The `main` default value is not returned in the `git rev-parse` command and the `ifeq` condition
	@$(eval branch ?= main)
ifeq ($(shell git rev-parse --verify $(branch) 2>/dev/null),)
	@echo "$(RED)⨯$(RESET) The $(branch) branch does not exist."
else
	@echo "$(GREEN)✓$(RESET) The $(branch) branch exists."
endif

.PHONY: __git_exists_bis
__git_exists_bis: # TODO: Works very well, with a default value
	@branch=$${branch:-"main"}; exists=$$(git rev-parse --verify $${branch} 2>/dev/null); \
	[ "$${exists}" = "" ] \
		&& echo "$(RED)⨯$(RESET) The $${branch} branch does not exist." \
		|| echo "$(GREEN)✓$(RESET) The $${branch} branch exists.";