#
# COLORS
#

# (G)REEN, (R)ED, (Y)ELLOW & RE(S)ET
G = "\\033[32m"
R = "\\033[31m"
Y = "\\033[33m"
S = "\\033[0m"

#
# COMPOSER
#

# Use directly composer or the dockerized version.
COMPOSER = composer

## — 🎵 🚀 THE COMPOSER MAKEFILE 🚀 🎵 ————————————————————————————————————————

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

.PHONY: install
install: composer_install ## Install a local project (the very first time after cloning)

.PHONY: check
check: composer_validate ## Check everything before you deliver

.PHONY: versions
versions: composer_version ## Display all versions of the libraries available in that Makefile

## — COMPOSER 🧙 ——————————————————————————————————————————————————————————————

.PHONY: composer
composer: ## Run composer - $ make composer [ARG=<arguments>] - Example: $ make composer ARG="require --dev phpunit/phpunit"
	$(COMPOSER) $(ARG)

composer_validate: ## Validate composer.json and composer.lock
	$(COMPOSER) validate --strict --check-lock

composer_clean: confirm ## Remove vendor & composer.lock [y/N]
	rm composer.lock && rm -Rf vendor

##

composer_install: vendor composer.lock ## Install packages using composer
	$(COMPOSER) install

composer_install@prod: ## Install packages using composer (PROD)
	$(COMPOSER) install --verbose --prefer-dist --no-progress --no-interaction --no-dev --optimize-autoloader

composer_update: ## Update packages using composer
	$(COMPOSER) update

composer_update@prod: ## Update packages using composer (PROD)
	$(COMPOSER) update --verbose --prefer-dist --no-progress --no-interaction --no-dev --optimize-autoloader

##

composer.lock: composer.json ## Check if the composer.lock is up to date with the latest changes in composer.json (run 'composer update') [y/N]
	@printf "$(Y)Warning: The composer.lock is not up to date with the latest changes in composer.json (run 'composer update').$(S)\n"
	@$(MAKE) -s question TEXT="Run 'composer update'?" YES="composer_update"

vendor: composer.json ## Check if vendor is up to date with the latest changes in composer.json (run 'composer install')
	@printf "$(Y)Warning: vendor is not up to date with the latest changes in composer.json (run 'composer install').$(S)\n"
	$(COMPOSER) install

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
