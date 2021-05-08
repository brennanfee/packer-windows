#!/usr/bin/env bash

# Bash "strict" mode
SOURCED=false && [ "$0" = "$BASH_SOURCE" ] || SOURCED=true
if ! $SOURCED; then
  set -eEuo pipefail
  shopt -s extdebug
  trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR
  IFS=$'\n\t'
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function load_box() {
  local BOX_FILE=$1
  if [[ -f "$SCRIPT_DIR/boxes/$BOX_FILE.box" ]]; then
    if [[ $(vagrant box list | grep -i "$BOX_FILE") ]]; then
      echo -e "\e[93mRemoving old box - $BOX_FILE\e[0m"
      vagrant box remove "$BOX_FILE"
    fi

    echo -e "\e[93mAdding box - $BOX_FILE\e[0m"
    vagrant box add "$SCRIPT_DIR/boxes/$BOX_FILE.box" --name "$BOX_FILE"
  fi
}

load_box "bfee-windows10-bare"
