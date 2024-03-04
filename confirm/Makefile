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

# Colors
F_RESET = "\\033[0m"
C_RED = "\\033[31m"
C_GREEN = "\\033[32m"
C_YELLOW = "\\033[33m"
C_BLUE = "\\033[34m"

# Makefile
MAKE_S = make -s

## — PROJECT 🚀 ———————————————————————————————————————————————————————————————

.PHONY: do_you_want
do_you_want: ## Do you want?
	@$(MAKE_S) confirm question="Do you want?" yes="yes_i_do" no="no_i_don_t"

.PHONY: yes_i_do
yes_i_do: ## Yes, I do!
	@echo "$(C_BLUE)Yes, I do!$(F_RESET)"

.PHONY: no_i_don_t
no_i_don_t: ## No, I don't!
	@echo "$(C_RED)No, I don't!$(F_RESET)"

##

.PHONY: do_you_want_no_interaction
do_you_want_no_interaction: ## Do you want? (no interaction)
	@$(MAKE_S) do_you_want no_interaction="true"

## — INTERNAL 🚧‍️ ——————————————————————————————————————————————————————————————

.PHONY: confirm
confirm: ## Display a confirmation before executing a makefile command. Example: @$(MAKE_S) confirm question="Are you sure" yes="command_yes" no="command_no"
	@$(eval question ?=) 		# Question to display
	@$(eval yes ?=)				# Makefile command to execute on yes
	@$(eval no ?=)				# Makefile command to execute on no
	@$(eval no_interaction ?=)	# Do not ask any interactive question
	@\
	question=$${question:-"Confirm?"}; \
	if [ "$${no_interaction}" != "true" ]; then \
		echo -n "$(C_GREEN)$${question}$(F_RESET) [$(C_YELLOW)y/N$(F_RESET)]: "; \
		read answer; \
	fi; \
	answer=$${answer:-N}; \
	if [ "$${answer}" = y ] || [ "$${answer}" = Y ] || [ "$${no_interaction}" = "true" ]; then \
		[ -z "$$yes" ] && echo "$(C_YELLOW)(YES) no action!$(F_RESET)" || $(MAKE_S) $$yes; \
	else \
		[ -z "$$no" ] && echo "$(C_YELLOW)(NO) no action!$(F_RESET)" || $(MAKE_S) $$no; \
	fi