MOUSE=`xinput | grep -o "\(Wireless\s*id=\)[0-9]*" | grep -o "[0-9]*"`

for i in $MOUSE;
do
    xinput --set-prop $i 'libinput Accel Profile Enabled' 0 1
done
