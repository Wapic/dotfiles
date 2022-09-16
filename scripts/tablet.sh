TABLET=`xsetwacom --list devices | grep --max-count=1 -o "[0-9]"`

xsetwacom --set $TABLET RawSample 1 &&
xsetwacom --set $TABLET Suppress 0 &&
xsetwacom --set $TABLET Area "0 0 6840 4275" &&
xsetwacom --set $TABLET MapToOutput HEAD-0
