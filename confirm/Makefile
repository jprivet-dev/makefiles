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

.PHONY: do_you_want
do_you_want: ## Do you want? [y/N]
	@make -s confirm question="Do you want?" make_yes="_internal_yes_i_do" make_no="_internal_no_i_don_t"

.PHONY: _internal_yes_i_do
_internal_yes_i_do: # Yes, I do! INTERNAL
	@echo "$(BLUE)Yes, I do!$(RESET)"

.PHONY: _internal_no_i_don_t
_internal_no_i_don_t: # No, I don't! INTERNAL
	@echo "$(RED)No, I don't!$(RESET)"

.PHONY: do_you_want_yes_action
do_you_want_yes_action: ## Do you want? ('yes' action) [y/N]
	@make -s confirm question="Do you want? ('yes' action)" make_yes="_internal_yes_i_do"

.PHONY: do_you_want_no_action
do_you_want_no_action: ## Do you want? ('no' action) [y/N]
	@make -s confirm question="Do you want? ('no' action)" make_no="_internal_no_i_don_t"

.PHONY: do_you_want_no_interaction
do_you_want_no_interaction: ## Do you want? (no interaction)
	@make -s do_you_want no_interaction="true"

##

.PHONY: do_you_want_to_continue
do_you_want_to_continue: confirm_continue ## Do you want to continue? [y/N]
	@echo "$(YELLOW)Yes, we continue!$(RESET)"

## — INTERNAL 🚧‍️ ——————————————————————————————————————————————————————————————

.PHONY: confirm
confirm: ## Display a confirmation before executing a makefile command. Example: @make -s confirm question="Are you sure?" make_yes="my_command_on_yes" make_no="my_command_on_no"
	@$(eval question ?=)        # Question to display
	@$(eval make_yes ?=)        # Makefile commands to execute on yes
	@$(eval make_no ?=)         # Makefile commands to execute on no
	@$(eval no_interaction ?=)  # Do not ask any interactive question
	@\
	question=$${question:-"Confirm?"}; \
	if [ "$${no_interaction}" != "true" ]; then \
		echo -n "$(GREEN)$${question}$(RESET) [$(YELLOW)y/N$(RESET)]: "; \
		read answer; \
	fi; \
	answer=$${answer:-N}; \
	if [ "$${answer}" = y ] || [ "$${answer}" = Y ] || [ "$${no_interaction}" = "true" ]; then \
		[ -z "$$make_yes" ] && echo "$(YELLOW)(YES) no action!$(RESET)" || make -s $$make_yes; \
	else \
		[ -z "$$make_no" ] && echo "$(YELLOW)(NO) no action!$(RESET)" || make -s $$make_no; \
	fi

PHONY: confirm_continue
confirm_continue: ## Display a confirmation before continuing [y/N]
	@echo -n "$(GREEN)Do you want to continue?$(RESET) [$(YELLOW)y/N$(RESET)]: " && read answer && [ $${answer:-N} = y ]
