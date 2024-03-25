# Usage:
#
# $ make do_you_want
# Do you want? [y/N]:
# No, I don't!
#
# $ make do_you_want
# Do you want? [y/N]: y
# Yes, I do!
#
# $ make do_you_want no_interaction="true"
# Yes, I do!

#
# Colors
#

RESET = "\\033[0m"
BLUE = "\\033[34m"
GREEN = "\\033[32m"
RED = "\\033[31m"
YELLOW = "\\033[33m"

## — PROJECT 🚀 ———————————————————————————————————————————————————————————————

.PHONY: do_you_want
do_you_want: ## Do you want?
	@make -s confirm question="Do you want?" yes="yes_i_do" no="no_i_don_t"

.PHONY: yes_i_do
yes_i_do: ## Yes, I do!
	@echo "$(BLUE)Yes, I do!$(RESET)"

.PHONY: no_i_don_t
no_i_don_t: ## No, I don't!
	@echo "$(RED)No, I don't!$(RESET)"

##

.PHONY: do_you_want_no_interaction
do_you_want_no_interaction: ## Do you want? (no interaction)
	@make -s do_you_want no_interaction="true"

## — INTERNAL 🚧‍️ ——————————————————————————————————————————————————————————————

.PHONY: confirm
confirm: ## Display a confirmation before executing a makefile command. Example: @make -s confirm question="Are you sure" yes="command_yes" no="command_no"
	@$(eval question ?=)        # Question to display
	@$(eval yes ?=)             # Makefile commands to execute on yes
	@$(eval no ?=)              # Makefile commands to execute on no
	@$(eval no_interaction ?=)  # Do not ask any interactive question
	@\
	question=$${question:-"Confirm?"}; \
	if [ "$${no_interaction}" != "true" ]; then \
		echo -n "$(GREEN)$${question}$(RESET) [$(YELLOW)y/N$(RESET)]: "; \
		read answer; \
	fi; \
	answer=$${answer:-N}; \
	if [ "$${answer}" = y ] || [ "$${answer}" = Y ] || [ "$${no_interaction}" = "true" ]; then \
		[ -z "$$yes" ] && echo "$(YELLOW)(YES) no action!$(RESET)" || make -s $$yes; \
	else \
		[ -z "$$no" ] && echo "$(YELLOW)(NO) no action!$(RESET)" || make -s $$no; \
	fi