#!/bin/sh

monitor-sensor | while read -r line; do
    case "$line" in
        *normal*)    transform=0 ;;
        *right-up*)  transform=3 ;;
        *bottom-up*) transform=2 ;;
        *left-up*)   transform=1 ;;
        *) continue ;;
    esac

    echo "$transform"

    hyprctl eval "
hl.config({
    input = {
        touchdevice = {
            transform = $transform
        }
    }
})

hl.monitor({
    output = \"eDP-1\",
    mode = \"1920x1200@60\",
    position = \"1920x0\",
    scale = 1.2,
    transform = $transform
})
"
done
