#!/bin.bash
c=$HOME/.config
rm -rf $c/bspwm
rm -rf $c/sxhkd
rm -rf $c/polybar
cd $c/Dots
cp bspwmrc $c/bspwm
cp sxhkdrc $c/sxhkd
cp -r polybar $c
