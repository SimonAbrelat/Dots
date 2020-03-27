#!/bin/sh
cd ~
config=$HOME/.config
dots=$HOME/.config/Dots
cp /etc/zsh/zshenv $dots/zsh
cp $config/zsh/.zshrc $dots/zsh
cp $config/zsh/alias.zsh $dots/zsh
cp $config/alacritty/alacritty.yml $dots
cp -r $config/scripts $dots
cp -r $config/rofi $dots

bash update_wm.sh
