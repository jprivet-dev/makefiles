#
# EXECUTABLES (LOCAL)
#

# Use directly composer or the dockerized version.
COMPOSER = composer

#
# COLORS
#

RESET     = "\\033[0m"
BLUE      = "\\033[34m"
GREEN     = "\\033[32m"
RED       = "\\033[31m"
YELLOW    = "\\033[33m"
UNDERLINE = "\\033[4m"

## — 🎵 🚀 THE COMPOSER MAKEFILE 🚀 🎵 ————————————————————————————————————————

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
			if (line[1] == "Makefile") { \
				# If you import a file in this Makefile (e.g.: include .env), line[1] is given the name of the current Makefile. \
				# You need to use targets=line[2] instead of targets=line[1]. \
				targets=line[2]; \
			} else { \
				targets=line[1]; \
			} \
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
composer: ## Run composer. Arguments: p (composer params). Example: $ make composer p="require --dev phpunit/phpunit"
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
	@echo "$(YELLOW)Warning: The composer.lock is not up to date with the latest changes in composer.json (run 'composer update').$(RESET)"
	@$(MAKE) -s confirm question="Run 'composer update'?" make_yes="composer_update"

vendor: composer.json ## Check if vendor is up to date with the latest changes in composer.json (run 'composer install')
	@echo "$(YELLOW)Warning: vendor is not up to date with the latest changes in composer.json (run 'composer install').$(RESET)"
	$(COMPOSER) install

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