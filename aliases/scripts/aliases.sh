# Usage:
#   . scripts/aliases.sh [options]

# (G)REEN, (Y)ELLOW & RE(S)ET
G="\033[32m"
Y="\033[33m"
S="\033[0m"

function aliases_create() {
  local name="${1}"
  printf "✅ Create ${G}${name}${S} alias for the ${G}make ${name}${S} command\n"
  alias ${name}="aliases_make ${name}"
}

function aliases_delete() {
  local name="${1}"
  printf "❌ Delete ${G}${name}${S} alias for the ${G}make ${name}${S} command\n"
  unalias ${name}
}

function aliases_make() {
  local name="${1}"
  shift
  make ${name} p="${*}"
}

function aliases_help() {
  printf "\n"
  printf "${Y}Description:${S}\n"
  printf "  Create or delete aliases for make commands\n"
  printf "\n"
  printf "${Y}Usage:${S}\n"
  printf "  . aliases [options]\n"
  printf "\n"
  printf "${Y}Options:${S}\n"
  printf "  ${G}--help, -h    ${S}Show help\n"
  printf "  ${G}--delete, -d  ${S}Delete all aliases\n"
  printf "\n"
  printf "${Y}Help:${S}\n"
  printf "  Create all aliases:\n"
  printf "\n"
  printf "    ${G}. aliases${S}\n"
  printf "\n"
  printf "  Delete all aliases:\n"
  printf "\n"
  printf "    ${G}. aliases --delete${S}\n"
  printf "\n"
}

function aliases_delete_all() {
  aliases_delete foo
  aliases_delete bar
}

function aliases_create_all() {
  aliases_create foo
  aliases_create bar
  printf "\n"
  printf "Delete all aliases with ${G}. aliases --delete${S} command\n"
  printf "Show help with ${G}. aliases --help${S} command\n"
}

case ${1} in
-h | --help)
  aliases_help
  ;;
-d | --delete)
  aliases_delete_all
  ;;
*)
  aliases_create_all
  ;;
esac
