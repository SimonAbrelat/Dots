#!/bin/bash
x=$HOME/.config/Dots/wms/xmonad
d=$HOME/.xmonad

cp $d/xmonad.hs $x
cp $d/build $x

echo "SAVED XMONAD!"
