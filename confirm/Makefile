# @see https://stackoverflow.com/questions/589276/how-can-i-use-bash-syntax-in-makefile-targets
# @see https://www.gnu.org/software/make/manual/html_node/Choosing-the-Shell.html
SHELL:=/bin/bash

#
# COLORS
#

RESET     = "\\033[0m"
BLUE      = "\\033[34m"
GREEN     = "\\033[32m"
RED       = "\\033[31m"
YELLOW    = "\\033[33m"
UNDERLINE = "\\033[4m"

## — 🎵 🚀 THE CONFIRM MAKEFILE 🚀 🎵 —————————————————————————————————————————

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

.PHONY: do_you_want
do_you_want: ## Do you want? [y/N]
	@$(MAKE) -s confirm question="Do you want?" make_yes="_internal_yes_i_do" make_no="_internal_no_i_don_t"

.PHONY: _internal_yes_i_do
_internal_yes_i_do: # Yes, I do! INTERNAL
	@printf "$(BLUE)Yes, I do!$(RESET)\n"

.PHONY: _internal_no_i_don_t
_internal_no_i_don_t: # No, I don't! INTERNAL
	@printf "$(RED)No, I don't!$(RESET)\n"

.PHONY: do_you_want_yes_action
do_you_want_yes_action: ## Do you want? ('yes' action) [y/N]
	@$(MAKE) -s confirm question="Do you want? ('yes' action)" make_yes="_internal_yes_i_do"

.PHONY: do_you_want_no_action
do_you_want_no_action: ## Do you want? ('no' action) [y/N]
	@$(MAKE) -s confirm question="Do you want? ('no' action)" make_no="_internal_no_i_don_t"

.PHONY: do_you_want_yes_by_default
do_you_want_yes_by_default: ## Do you want? (no interaction)
	@$(MAKE) -s do_you_want yes_by_default="true"

##

.PHONY: do_you_want_to_continue
do_you_want_to_continue: confirm_continue ## Do you want to continue? [y/N]
	@printf "$(YELLOW)Yes, we continue!$(RESET)\n"

##

.PHONY: multi_steps
multi_steps: do_you_want_to_continue do_you_want ## Multi steps

.PHONY: multi_steps_yes_by_default
multi_steps_yes_by_default: ## Multi steps
	$(MAKE) -s multi_steps yes_by_default=true
##

.PHONY: choose_between_yes_or_no
choose_between_yes_or_no: ## Choose between yes or no [y/N]
	@printf "$(GREEN)Choose between yes or no$(RESET) [$(YELLOW)y/N$(RESET)]: " && read answer && answer=$${answer:-N}; \
	if [ "$${answer}" = y ] || [ "$${answer}" = Y ]; then $(MAKE) -s _internal_yes_i_do; \
	else $(MAKE) -s _internal_no_i_don_t; fi

## — INTERNAL 🚧‍️ ——————————————————————————————————————————————————————————————

.PHONY: confirm
confirm: ## Display a confirmation before executing a makefile command - $ make confirm question=<question> [make_yes=<command>] [make_no=<command>] [yes_by_default=<bool>]
	@$(if $(question),, $(error question argument is required))   # Question to display
	@$(eval make_yes ?=)                                          # Makefile commands to execute on yes
	@$(eval make_no ?=)                                           # Makefile commands to execute on no
	@$(eval yes_by_default ?=)                                    # Default ‘yes’ answer
	@\
	question=$${question:-"Confirm?"}; \
	if [ "$${yes_by_default}" != "true" ]; then \
		printf "$(GREEN)$${question}$(RESET) [$(YELLOW)y/N$(RESET)]: " && read answer; \
	fi; \
	answer=$${answer:-N}; \
	if [ "$${answer}" = y ] || [ "$${answer}" = Y ] || [ "$${yes_by_default}" = "true" ]; then \
		[ -z "$$make_yes" ] && printf "$(YELLOW)(YES) no action!$(RESET)\n" || $(MAKE) -s $$make_yes; \
	else \
		[ -z "$$make_no" ] && printf "$(YELLOW)(NO) no action!$(RESET)\n" || $(MAKE) -s $$make_no; \
	fi

PHONY: confirm_continue
confirm_continue: ## Display a confirmation before continuing [y/N]
	@$(eval yes_by_default ?=) # Default ‘yes’ answer
	@if [ "$${yes_by_default}" == "true" ]; then exit 0; fi; \
	printf "$(GREEN)Do you want to continue?$(RESET) [$(YELLOW)y/N$(RESET)]: " && read answer && [ $${answer:-N} = y ]
