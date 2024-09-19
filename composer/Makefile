#
# COLORS
#

RESET     = "\\033[0m"
BLUE      = "\\033[34m"
GREEN     = "\\033[32m"
RED       = "\\033[31m"
YELLOW    = "\\033[33m"
UNDERLINE = "\\033[4m"

#
# EXECUTABLES (LOCAL)
#

# Use directly composer or the dockerized version.
COMPOSER = composer

## — 🎵 🚀 THE COMPOSER MAKEFILE 🚀 🎵 ————————————————————————————————————————

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

.PHONY: install
install: composer_install ## Install a local project (the very first time after cloning)

.PHONY: check
check: composer_validate ## Check everything before you deliver

.PHONY: versions
versions: composer_version ## Display all versions of the libraries available in that Makefile

## — COMPOSER 🧙 ——————————————————————————————————————————————————————————————

.PHONY: composer
composer: ## Run composer - $ make composer [p=<param>] - Example: $ make composer p="require --dev phpunit/phpunit"
	@$(eval p ?=)
	$(COMPOSER) $(p)

.PHONY: composer_version
composer_version: ## Composer version
	$(COMPOSER) --version

.PHONY: composer_validate
composer_validate: ## Validate composer.json and composer.lock
	$(COMPOSER) validate --strict --lock

.PHONY: composer_clean
composer_clean: confirm_continue ## Remove vendor & composer.lock [y/N]
	rm composer.lock && rm -Rf vendor

##

.PHONY: composer_install
composer_install: vendor composer.lock ## Install packages using composer
	$(COMPOSER) install

.PHONY: composer_install@prod
composer_install@prod: ## Install packages using composer (PROD)
	$(COMPOSER) install --verbose --prefer-dist --no-progress --no-interaction --no-dev --optimize-autoloader

.PHONY: composer_update
composer_update: ## Update packages using composer
	$(COMPOSER) update

.PHONY: composer_update@prod
composer_update@prod: ## Update packages using composer (PROD)
	$(COMPOSER) update --verbose --prefer-dist --no-progress --no-interaction --no-dev --optimize-autoloader

##

composer.lock: composer.json ## Check if the composer.lock is up to date with the latest changes in composer.json (run 'composer update') [y/N]
	@printf "$(YELLOW)Warning: The composer.lock is not up to date with the latest changes in composer.json (run 'composer update').$(RESET)\n"
	@$(MAKE) -s confirm question="Run 'composer update'?" make_yes="composer_update"

vendor: composer.json ## Check if vendor is up to date with the latest changes in composer.json (run 'composer install')
	@printf "$(YELLOW)Warning: vendor is not up to date with the latest changes in composer.json (run 'composer install').$(RESET)\n"
	$(COMPOSER) install

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
	@if [ "$${yes_by_default}" = "true" ]; then exit 0; fi; \
	printf "$(GREEN)Do you want to continue?$(RESET) [$(YELLOW)y/N$(RESET)]: " && read answer && [ $${answer:-N} = y ]

