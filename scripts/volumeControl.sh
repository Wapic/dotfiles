#!/usr/bin/env bash

function get_volume {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}'
}

function is_muted {
    pactl -- get-sink-mute 0 | awk '{print $2}' #yes/no
}

function send_notification {
    muted=$(is_muted)
    volume=$(get_volume)

    if [ "$1" == "mute" -a "$muted" == "yes" ]; then
        notify-send -r 5555 -u normal "MUTED"
        exit 1
    fi

    bar=$(seq -s "─" 0 $((volume / 5)) | sed 's/[0-9]//g')
    notify-send -r 5555 -u normal "$bar $volume"
}

case $1 in
    up)
        pactl -- set-sink-mute 0 0
        pactl -- set-sink-volume 0 +5%
        send_notification
    ;;
    down)
        pactl -- set-sink-mute 0 0
        pactl -- set-sink-volume 0 -5%
        send_notification
    ;;
    mute)
        pactl -- set-sink-mute 0 toggle
        send_notification $1
    ;;
esac

exit 1
