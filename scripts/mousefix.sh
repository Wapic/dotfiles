MOUSE=`xinput | grep "Compx X2 Mini Wireless \s" | grep -o "=[0-9]\{1,2\}" | grep -o "[0-9]\{1,2\}"`

for i in $MOUSE;
do
    xinput --set-prop $i 'libinput Accel Profile Enabled' 0 1
done
