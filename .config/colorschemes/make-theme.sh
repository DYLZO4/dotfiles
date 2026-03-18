#!/bin/bash
THEME_DIR="$HOME/.config/colorschemes"
THEME_NAME="$1"
COLORS_FILE="$2"

if [[ -z "$THEME_NAME" || -z "$COLORS_FILE" ]]; then
    echo "Usage: make-theme.sh <theme-name> <colors.conf>"
    exit 1
fi

if [[ ! -f "$COLORS_FILE" ]]; then
    echo "Colors file not found: $COLORS_FILE"
    exit 1
fi

THEME_PATH="$THEME_DIR/$THEME_NAME"

if [[ -d "$THEME_PATH" ]]; then
    echo "Theme already exists: $THEME_NAME"
    exit 1
fi

echo "Creating theme: $THEME_NAME"

# Parse colors file into variables
while IFS= read -r line || [[ -n "$line" ]]; do
    [[ "$line" =~ ^#.*$ ]] && continue
    [[ -z "$line" ]] && continue
    key=$(echo "$line" | awk '{print $1}' | tr -d '$')
    val=$(echo "$line" | awk '{print $3}' | sed 's/ff$//')
    eval "${key}=${val}"
done < "$COLORS_FILE"

mkdir -p "$THEME_PATH"/{hypr,waybar,kitty,wallpaper}

# --- Hyprland ---
cat <<EOF > "$THEME_PATH/hypr/colors.conf"
\$bg0     = rgba(${bg0}ff)
\$bg1     = rgba(${bg1}ff)
\$bg2     = rgba(${bg2}ff)
\$bg3     = rgba(${bg3}ff)

\$fg0     = rgba(${fg0}ff)
\$fg1     = rgba(${fg1}ff)
\$fg2     = rgba(${fg2}ff)
\$fg3     = rgba(${fg3}ff)

\$accent0 = rgba(${accent0}ff)
\$accent1 = rgba(${accent1}ff)
\$accent2 = rgba(${accent2}ff)
\$accent3 = rgba(${accent3}ff)
\$accent4 = rgba(${accent4}ff)
\$accent5 = rgba(${accent5}ff)
\$accent6 = rgba(${accent6}ff)
\$accent7 = rgba(${accent7}ff)

\$status_warning  = rgba(${status_warning}ff)
\$status_critical = rgba(${status_critical}ff)
\$status_success  = rgba(${status_success}ff)
EOF

# --- Waybar ---
cat <<EOF > "$THEME_PATH/waybar/colors.css"
@define-color bg0     #$bg0;
@define-color bg1     #$bg1;
@define-color bg2     #$bg2;
@define-color bg3     #$bg3;

@define-color fg0     #$fg0;
@define-color fg1     #$fg1;
@define-color fg2     #$fg2;
@define-color fg3     #$fg3;

@define-color accent0 #$accent0;
@define-color accent1 #$accent1;
@define-color accent2 #$accent2;
@define-color accent3 #$accent3;
@define-color accent4 #$accent4;
@define-color accent5 #$accent5;
@define-color accent6 #$accent6;
@define-color accent7 #$accent7;

@define-color status_warning  #$status_warning;
@define-color status_critical #$status_critical;
@define-color status_success  #$status_success;
EOF

# --- Kitty ---
cat <<EOF > "$THEME_PATH/kitty/colors.conf"
background             #$bg0
foreground             #$fg0
selection_background   #$bg2
selection_foreground   #$fg0
cursor                 #$fg0

color0  #$bg0
color1  #$accent6
color2  #$accent7
color3  #$accent5
color4  #$accent1
color5  #$accent3
color6  #$accent0
color7  #$fg2
color8  #$bg3
color9  #$accent6
color10 #$accent7
color11 #$accent5
color12 #$accent1
color13 #$accent3
color14 #$accent0
color15 #$fg0
EOF

touch "$THEME_PATH/wallpaper/wallpaper.jpg"

echo "Theme '$THEME_NAME' created at $THEME_PATH"
echo "  Add a wallpaper to $THEME_PATH/wallpaper/"
echo "  Then run: theme-switch $THEME_NAME"
