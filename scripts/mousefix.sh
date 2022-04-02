MOUSE=`xinput | grep "Glorious Model O Wireless \s" | grep -o "[0-9]*\s"`

for i in $MOUSE;
do
    xinput --set-prop $i 'libinput Accel Profile Enabled' 0 1
done
