#!/bin/bash

THEME_DIR="$HOME/.config/colorschemes"

# List all theme directories
THEMES=$(find "$THEME_DIR" -mindepth 1 -maxdepth 1 -type d | xargs -n1 basename | sort)

# Launch Rofi menu
SELECTED_THEME=$(echo "$THEMES" | rofi -dmenu -p "Select Theme")

if [[ -n "$SELECTED_THEME" ]]; then
    ~/.config/colorschemes/switch-theme.sh "$SELECTED_THEME"
fi
