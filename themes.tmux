#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/script/helper.sh"
default_themes_color="blue"

main() {
	local themes_color="$(get_tmux_option "@themes_color" "$default_themes_color")"
  source "$CURRENT_DIR/theme/${themes_color}.color"
  $(default_tmux_setup)
}
main
