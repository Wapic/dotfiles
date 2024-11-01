#!/usr/bin/env bash

function get_brightness {
    brightnessctl i | grep Current | grep -o "[0-9]*%" | cut -d "%" -f 1
}

function send_notification {
    brightness=$(get_brightness)
    bar=$(seq -s "─" 0 $((brightness / 5)) | sed 's/[0-9]//g')
    notify-send -r 5555 -u normal "$bar $brightness"
}

case $1 in
    up)
        brightnessctl s 5%+
        send_notification
    ;;
    down)
        brightnessctl s 5%-
        send_notification
    ;;
esac
