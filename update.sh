#!/bin.bash
c=$HOME/.config
rm -rf $c/scripts
rm -rf $c/rofi
rm -rf $c/zsh
rm -rf $c/zathura
cd $c/Dots
cp alacritty.yml $c/alacritty
cp -r scripts $c
cp -r rofi $c
cp -r zsh $c
cp -r zathura $c

bash $c/update_wm.sh
echo "UPDATED!"
