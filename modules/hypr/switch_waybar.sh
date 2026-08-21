#!/usr/bin/env zsh

WAYBAR_DIR="/home/kax/dotfiles/modules/waybar"
ACTIVE="$WAYBAR_DIR/config.jsonc"

ALL="$WAYBAR_DIR/config-all.jsonc"
HDMI="$WAYBAR_DIR/waylap.jsonc"

# If config.jsonc is a symlink, check where it points
CURRENT=$(readlink "$ACTIVE")

if [[ "$CURRENT" == "$HDMI" ]]; then
    ln -sf "$ALL" "$ACTIVE"
else
    ln -sf "$HDMI" "$ACTIVE"
fi

# Reload Waybar
pkill waybar
waybar -c /home/kax/dotfiles/modules/waybar/config.jsonc -s /home/kax/dotfiles/modules/waybar/style.css
