#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/script/helper.sh"

default_themes_color="blue"
default_themes_status_right="right"
default_themes_status_left="left"


main() {
	local themes_color="$(get_tmux_option "@themes_color" "$default_themes_color")"
#  source "$CURRENT_DIR/theme/${theme_color}.color"



  tmux source-file "$CURRENT_DIR/theme/${themes_color}.color"

#  themes_status_right="$(get_tmux_option "@themes_status_right" "$default_themes_status_right")"
#  themes_status_left="$(get_tmux_option "@themes_status_left" "$default_themes_status_left")"
  tmux source-file "$CURRENT_DIR/default.tmuxtheme"

#  echo ${themes_status_right}
#  echo ${themes_status_left}

#  tmux set -g status-right "${themes_status_right}"
#  tmux set -g status-left "${themes_status_left}"


}
main
