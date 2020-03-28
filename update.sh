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
mkdir -p $c/zsh/plugins
cd $c/zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/romkatv/gitstatus
wget https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/LS_COLORS

echo "UPDATED!"
