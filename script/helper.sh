get_tmux_option() {
	local option="$1"
	local default_value="$2"
	local option_value="$(tmux show-option -gqv "$option")"
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

default_tmux_setup() {
  # Status update interval
  tmux set -g status-interval 1

  # Basic status bar colors
  tmux set -g status-fg colour240
  tmux set -g status-bg colour233

  # Left side of status bar
  tmux set -g status-left-bg colour233
  tmux set -g status-left-fg colour243
  tmux set -g status-left-length 40

  # Right side of status bar
  tmux set -g status-right-bg colour233
  tmux set -g status-right-fg colour243
  tmux set -g status-right-length 150

  # Window status
  tmux set -g window-status-format " #I:#W#F "
  tmux set -g window-status-current-format "#[fg=$themes_sep_fg,bg=$themes_sep_bg,nobold]  #I:#W#F #[fg=$themes_sep_fg,bg=$themes_sep_bg,nobold]"

  # Current window status
  tmux set -g window-status-current-bg "$themes_bg"
  tmux set -g window-status-current-fg "$themes_fg"

  # Window with activity status
  tmux set -g window-status-activity-bg "$themes_bg" # fg and bg are flipped here due to
  tmux set -g window-status-activity-fg "$themes_fg" # a bug in tmux

  # Window separator
  tmux set -g window-status-separator ""

  # Window status alignment
  tmux set -g status-justify centre

  # Pane border
  tmux set -g pane-border-bg default
  tmux set -g pane-border-fg "$themes_fg"

  # Active pane border
  tmux set -g pane-active-border-bg default
  tmux set -g pane-active-border-fg "$themes_fg"

  # Pane number indicator
  tmux set -g display-panes-colour colour233
  tmux set -g display-panes-active-colour colour245

  # Clock mode
  tmux set -g clock-mode-colour "$themes_bg"
  tmux set -g clock-mode-style 24

  # Message
  tmux set -g message-bg "$themes_bg"
  tmux set -g message-fg black

  # Command message
  tmux set -g message-command-bg colour233
  tmux set -g message-command-fg black

  # Mode
  tmux set -g mode-bg "$themes_bg"
  tmux set -g mode-fg "$themes_bg"
}
