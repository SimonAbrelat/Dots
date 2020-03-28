#!/bin/bash
x=$HOME/.config/Dots/wm/xmonad
# Stack
curl -sSL https://get.haskellstack.org/ | sudo sh
# Dependencies
sudo apt install libx11-dev libxinerama-dev libxext-dev libxrandr-dev libxss-dev libxft-dev libghc-xmonad-contrib-dev libghc-xmonad-dev suckless-tools

# Install xmonad and xmobar
mkdir -p $HOME/.xmonad
cd $HOME/.xmonad
git clone "https://github.com/xmonad/xmonad" xmonad-git
git clone "https://github.com/xmonad/xmonad-contrib" xmonad-contrib-git
git clone "https://github.com/jaor/xmobar" xmobar-git

cp $x/build .
cp $x/xmonad.hs .

stack init
stack install
xmonad --recompile && xmonad --restart
sudo cp $x/xmonad.desktop /usr/share/xsessions

echo "INSTALLED XMONAD"
