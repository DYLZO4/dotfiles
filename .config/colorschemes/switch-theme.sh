#!/bin/bash
THEME_DIR="$HOME/.config/colorschemes"
APPS_CONF="$HOME/.config/colorschemes/apps.conf"
THEME_NAME="$1"

if [[ -z "$THEME_NAME" ]]; then
    echo "Usage: $0 <theme_name>"
    exit 1
fi

THEME_PATH="$THEME_DIR/$THEME_NAME"

if [[ ! -d "$THEME_PATH" ]]; then
    echo "Theme '$THEME_NAME' does not exist."
    exit 1
fi

echo "Applying theme: $THEME_NAME"

while IFS= read -r line || [[ -n "$line" ]]; do
    [[ "$line" =~ ^#.*$ ]] && continue
    [[ -z "$line" ]] && continue

    APP=$(echo "$line" | awk '{print $1}')
    SRC_SUB=$(echo "$line" | awk '{print $2}')
    DEST=$(eval echo $(echo "$line" | awk '{print $3}'))
    RELOAD=$(echo "$line" | awk '{print substr($0, index($0,$4))}' | tr -d '"')

    SRC="$THEME_PATH/$SRC_SUB"

    if [[ -f "$SRC" ]]; then
        mkdir -p "$(dirname "$DEST")"
        ln -sf "$SRC" "$DEST"
        echo "  $APP: $DEST -> $SRC"
        [[ -n "$RELOAD" ]] && eval "$RELOAD"
    else
        echo "  SKIP $APP: $SRC not found"
    fi

done < "$APPS_CONF"

WALL=$(find "$THEME_PATH/wallpaper" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) 2>/dev/null | head -n1)
if [[ -n "$WALL" ]]; then
    awww img "$WALL" --transition-type wipe --transition-duration 0.3
    echo "  wallpaper: $WALL"
else
    echo "  SKIP wallpaper: none found"
fi

notify-send "Theme Switcher" "Applied theme: $THEME_NAME"
