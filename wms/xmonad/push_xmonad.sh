#!/bin/bash
x=$HOME/.config/Dots/wms/xmonad
d=$HOME/.xmonad
if [ ! -d /.xmonad ]; then
    curr=${pwd}
    mkdir -p $d
    cd $d
    stack init
    stack install
    cd $curr
fi
cp $x/build $d
cp $x/xmonad.hs $d
xmonad --recompile && xmonad --restart

sudo cp $x/xmonad.desktop /usr/share/xsessions

echo "PUSHED XMONAD!"
