#!/bin/bash
rm -rf $HOME/.xmonad
rm -rf $HOME/.config/xmobar
sudo rm /usr/share/xsessions/xmonad.desktop
sudo rm $HOME/.local/bin/xmonad
sudo rm $HOME/.local/bin/xmobar

echo "CLEANED XMONAD"
