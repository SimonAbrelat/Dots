#!/bin/sh
config=$HOME/.config
dots=$HOME/.config/Dots
cp /etc/zsh/zshenv $dots/zsh
cp $HOME/.Xresources $dots/Xresources
cp $config/alacritty/alacritty.yml $dots
cp -r $config/scripts $dots
cp -r $config/rofi $dots
cp -r $config/zsh $dots
rm $dots/zsh/comp
rm $dots/zsh/.zcompdump
rm -rf $dots/zsh/plugins
rm $dots/zsh/history
rm $dots/scripts/monitors.sh

echo "SAVED!"
