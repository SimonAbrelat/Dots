#!/bin/sh
config=$HOME/.config
wm=$HOME/.config/Dots/wms
cp $config/bspwm/bspwmrc $wm/bspwm
cp $config/sxhkd/sxhkdrc $wm/bspwm
cp $config/scripts/monitors.sh $wm/bspwm
cp -r $config/polybar $wm

echo "SAVED BSPWM!"
