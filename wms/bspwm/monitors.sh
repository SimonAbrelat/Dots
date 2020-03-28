#!/bin/sh

external_display=$(xrandr --query | grep 'DP-2' | grep -w 'connected')

bash ~/.config/polybar/launch.sh
setxkbmap -option caps:escape
if [[ $external_display = *connected* ]]; then
    xrandr --output DP-2 --auto
    xrandr --output eDP-1 --off
    #bspc wm -r
    bspc monitor eDP-1 -d -1;
    bspc monitor DP-2 -d 1 2 3 4 5 6 7 8 9 10
else
    xrandr --output eDP-1 --auto
    xrandr --output DP-2 --off
    bspc monitor eDP1 -d 1 2 3 4 5 6 7 8 9 10
fi
