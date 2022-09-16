#!/bin/sh
import region.png && python /home/wapic/scripts/imgurUpload.py | xclip -selection clipboard -i
notify-send "Screenshot Uploader" "Done!"
