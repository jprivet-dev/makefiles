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
			split($$1, line, ":"); \
			# If you import a file in this Makefile (e.g.: include .env), line[1] is given the name of the current Makefile. \
			# You need to use targets=line[2] instead of targets=line[1]. \
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
	@echo "$(BLUE)Yes, I do!$(RESET)"

.PHONY: _internal_no_i_don_t
_internal_no_i_don_t: # No, I don't! INTERNAL
	@echo "$(RED)No, I don't!$(RESET)"

.PHONY: do_you_want_yes_action
do_you_want_yes_action: ## Do you want? ('yes' action) [y/N]
	@$(MAKE) -s confirm question="Do you want? ('yes' action)" make_yes="_internal_yes_i_do"

.PHONY: do_you_want_no_action
do_you_want_no_action: ## Do you want? ('no' action) [y/N]
	@$(MAKE) -s confirm question="Do you want? ('no' action)" make_no="_internal_no_i_don_t"

.PHONY: do_you_want_no_interaction
do_you_want_no_interaction: ## Do you want? (no interaction)
	@$(MAKE) -s do_you_want no_interaction="true"

##

.PHONY: do_you_want_to_continue
do_you_want_to_continue: confirm_continue ## Do you want to continue? [y/N]
	@echo "$(YELLOW)Yes, we continue!$(RESET)"

##

.PHONY: choose_between_yes_or_no
choose_between_yes_or_no: ## Choose between yes or no [y/N]
	@echo -n "$(GREEN)Choose between yes or no$(RESET) [$(YELLOW)y/N$(RESET)]: "; read answer; answer=$${answer:-N}; \
	if [ "$${answer}" = y ] || [ "$${answer}" = Y ]; then $(MAKE) -s _internal_yes_i_do; \
	else $(MAKE) -s _internal_no_i_don_t; fi

## — INTERNAL 🚧‍️ ——————————————————————————————————————————————————————————————

.PHONY: confirm
confirm: ## Display a confirmation before executing a makefile command. Arguments: question [make_yes] [make_no] [no_interaction]. Example: @$(MAKE) -s confirm question="Are you sure?" make_yes="command_on_yes" make_no="command_on_no"
	@$(if $(question),, $(error question argument is required))   # Question to display
	@$(eval make_yes ?=)                                          # Makefile commands to execute on yes
	@$(eval make_no ?=)                                           # Makefile commands to execute on no
	@$(eval no_interaction ?=)                                    # Do not ask any interactive question
	@\
	question=$${question:-"Confirm?"}; \
	if [ "$${no_interaction}" != "true" ]; then \
		echo -n "$(GREEN)$${question}$(RESET) [$(YELLOW)y/N$(RESET)]: "; \
		read answer; \
	fi; \
	answer=$${answer:-N}; \
	if [ "$${answer}" = y ] || [ "$${answer}" = Y ] || [ "$${no_interaction}" = "true" ]; then \
		[ -z "$$make_yes" ] && echo "$(YELLOW)(YES) no action!$(RESET)" || $(MAKE) -s $$make_yes; \
	else \
		[ -z "$$make_no" ] && echo "$(YELLOW)(NO) no action!$(RESET)" || $(MAKE) -s $$make_no; \
	fi

PHONY: confirm_continue
confirm_continue: ## Display a confirmation before continuing [y/N]
	@echo -n "$(GREEN)Do you want to continue?$(RESET) [$(YELLOW)y/N$(RESET)]: " && read answer && [ $${answer:-N} = y ]
