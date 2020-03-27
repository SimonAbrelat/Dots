#!/bin/sh
cd ~
config=$HOME/.config
dots=$HOME/.config/Dots
cp $config/bspwm/bspwmrc $dots
cp $config/sxhkd/sxhkdrc $dots
cp -r $config/polybar $dots
