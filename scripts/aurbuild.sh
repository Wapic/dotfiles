#!/bin/sh
echo "enter git url"

read URL
PACKAGE_NAME="${URL##*/}"

git clone $URL ~/builds/${PACKAGE_NAME%.*}
(cd ~/builds/${PACKAGE_NAME%.*} && makepkg -si)
