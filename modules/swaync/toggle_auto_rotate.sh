#!/bin/sh

SCRIPT="$HOME/dotfiles/modules/swaync/scripts/auto_rotate.sh"
PIDFILE="/tmp/hypr-auto-rotate.pid"

if pgrep -f "$SCRIPT" >/dev/null; then
    pkill -f "$SCRIPT"
    rm -f "$PIDFILE"
    notify-send "Auto Rotate" "Disabled"
else
    "$SCRIPT" &
    echo $! > "$PIDFILE"
    notify-send "Auto Rotate" "Enabled"
fi
