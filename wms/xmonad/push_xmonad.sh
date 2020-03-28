#!/bin/bash
x=$HOME/.config/Dots/wms/xmonad
d=$HOME/.xmonad
if [ ! -d /.xmonad ]; then
    curr=${pwd}
    mkdir -p $d
    cd $d
    git clone "https://github.com/xmonad/xmonad" xmonad-git
    git clone "https://github.com/xmonad/xmonad-contrib" xmonad-contrib-git
    git clone "https://github.com/jaor/xmobar" xmobar-git

    cp $x/build $x
    cp $x/xmonad.hs $x
    stack init
    cp $x/stack.yaml $d
    stack install
    cd $curr
fi
cp $x/build $d
cp $x/xmonad.hs $d
cp -r $x/xmobar ~/.config
xmonad --recompile && xmonad --restart

sudo cp $x/xmonad.desktop /usr/share/xsessions

echo "PUSHED XMONAD!"
