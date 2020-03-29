#!/bin/bash

if [ $(xrandr | grep " connected " | wc -l) -eq "2" ]; then
    mon=$(xrandr -d :0 -q | grep ' connected' | awk '{print $1}' | tail -1)
    xrandr --output $mon --auto
    xrandr --output eDP-1 --off
else
    xrandr --output eDP-1 --auto
fi
if [ ! -z "$1" ]; then
    case "$1" in
    -x|--xmonad)
        xmonad --restart
        ;;
    -t|--test) # end argument parsing
        echo "TEST"
        ;;
    -*|--*=) # unsupported flags
        echo "Error: Unsupported flag $1" >&2
        exit 1
        ;;
    *) # preserve positional arguments
        PARAMS="$PARAMS $1"
        shift
        ;;
    esac
fi
