#!/bin.bash
c=$HOME/.config
w=$c/Dots/wms
mkdir -p $c/bspwm
mkdir -p $c/sxhkd
cp $w/bspwm/bspwmrc $c/bspwm
cp $w/bspwm/sxhkdrc $c/sxhkd
cp -r $w/polybar $c
cp $w/bspwm/monitors.sh $c/scripts

echo "PUSHED BSPWM!"
