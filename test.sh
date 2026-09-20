#!/usr/bin/env bash

set -u

DEVICE="$(libinput list-devices | awk '
    /ThinkPad Extra Buttons/ { found=1 }
    found && /Kernel:/ {
        print $2
        exit
    }
')"

if [[ -z "$DEVICE" ]]; then
    echo "ThinkPad Extra Buttons not found" >&2
    exit 1
fi

echo "Listening on $DEVICE"

libinput debug-events --device "$DEVICE" | while read -r line; do
    case "$line" in
        *"SWITCH_TOGGLE"**"switch tablet-mode state 1"*)
            echo "Tablet mode ON"
            fcitx5
            ;;
        *"SWITCH_TOGGLE"**"switch tablet-mode state 0"*)
            echo "Tablet mode OFF"
            pkill -x fcitx5
            ;;
    esac
done
