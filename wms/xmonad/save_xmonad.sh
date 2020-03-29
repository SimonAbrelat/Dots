#!/bin/bash
x=$HOME/.config/Dots/wms/xmonad
d=$HOME/.xmonad

cp $d/xmonad.hs $x
cp $d/build $x
cp -r ~/.config/xmobar $x
cp ~/.config/scripts/monitors.sh $x

echo "SAVED XMONAD!"
