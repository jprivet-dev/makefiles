#
# COLORS
#

# (G)REEN, (R)ED, (Y)ELLOW & RE(S)ET
G = "\\033[32m"
R = "\\033[31m"
Y = "\\033[33m"
S = "\\033[0m"

## — 🎵 🚀 THE CONFIRM MAKEFILE 🚀 🎵 —————————————————————————————————————————

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

## — PROJECT 🚀 ———————————————————————————————————————————————————————————————

do_you_want: ## Do you want? [y/N]
	@$(MAKE) -s question TEXT="Do you want? ('yes' & 'no' actions)" YES="_internal_yes_i_do" NO="_internal_no_i_don_t"

do_you_want_yes: ## Do you want? ('yes' action) [y/N]
	@$(MAKE) -s question TEXT="Do you want? ('yes' action)" YES="_internal_yes_i_do"

do_you_want_no: ## Do you want? ('no' action) [y/N]
	@$(MAKE) -s question TEXT="Do you want? ('no' action)" NO="_internal_no_i_don_t"

do_you_want_no_interaction: ## Do you want? (no interaction)
	@$(MAKE) -s do_you_want NO_INTERACTION="true"

_internal_yes_i_do: # Yes, I do! INTERNAL
	@printf "$(B)Yes, I do!$(S)\n"

_internal_no_i_don_t: # No, I don't! INTERNAL
	@printf "$(R)No, I don't!$(S)\n"

##

do_you_want_to_continue: confirm ## Do you want to continue? [y/N]
	@printf "$(Y)Yes, we continue!$(S)\n"

##

multi_steps: do_you_want_to_continue do_you_want ## Multi steps

multi_steps_no_interaction: ## Multi steps
	$(MAKE) -s multi_steps NO_INTERACTION=true
##

choose_between_yes_or_no: ## Choose between yes or no [y/N]
	@printf "$(G)Choose between yes or no$(S) [$(Y)y/N$(S)]: " && read answer && answer=$${answer:-N}; \
	if [ "$${answer}" = y ] || [ "$${answer}" = Y ]; then $(MAKE) -s _internal_yes_i_do; \
	else $(MAKE) -s _internal_no_i_don_t; fi

## — INTERNAL 🚧‍️ ——————————————————————————————————————————————————————————————

.PHONY: question
question: ## Display a confirmation before executing a makefile command - @$(MAKE) -s question TEXT=<text> [YES=<command>] [NO=<command>] [NO_INTERACTION=<true|false>]
	@$(if $(TEXT),, $(error TEXT argument is required)) \
	TEXT=$${TEXT:-"Confirm?"}; \
	if [ "$${NO_INTERACTION}" != "true" ]; then \
		printf "$(G)$${TEXT}$(S) [$(Y)y/N$(S)]: " && read answer; \
	fi; \
	answer=$${answer:-N}; \
	if [ "$${answer}" = y ] || [ "$${answer}" = Y ] || [ "$${NO_INTERACTION}" = "true" ]; then \
		[ -z "$$YES" ] && printf "$(Y)(YES) no action!$(S)\n" || $(MAKE) -s $$YES NO_INTERACTION=true; \
	else \
		[ -z "$$NO" ] && printf "$(Y)(NO) no action!$(S)\n" || $(MAKE) -s $$NO; \
	fi

PHONY: confirm
confirm: ## Display a confirmation before continuing [y/N]
	@if [ "$${NO_INTERACTION}" = "true" ]; then exit 0; fi; \
	printf "$(G)Do you want to continue?$(S) [$(Y)y/N$(S)]: " && read answer && [ $${answer:-N} = y ]
