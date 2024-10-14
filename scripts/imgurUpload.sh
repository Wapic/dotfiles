#!/bin/bash
IMAGE=$(slurp | grim -g - - | base64)

RESULT=$(curl \
    --location "https://api.imgur.com/3/image" \
    --header "Authorization: Client-ID $(cat ~/.IMGUR_API_KEY)" \
    --form "image=\"$IMAGE\"" \
    --form 'type="base64"' \
    --silent 2>&1 | grep -E -o 'https://i.imgur.com/.*\.png')

wl-copy $RESULT

notify-send "Image Uploaded!" $RESULT

