#!/bin/bash
# Reset to home
cd ~
# Add repos
sudo add-apt-repository ppa:mmstick76/alacritty
sudo add-apt-repository ppa:neovim--ppa/stable
sudo apt update
# Install packages
## apt
sudo apt install build-essential git curl compton hsetroot feh neovim
sudo apt install xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev
sudo apt install libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev gcc make
sudo apt install libxcb-shape0-dev python3-pip
sudo apt install alacritty rofi fonts-firacode
# polybar
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev
sudo apt install libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev
sudo apt install libxcb-icccm4-dev libcurl4-openssl-dev
# pip
pip3 install pynvim
# snap
snap install spotify
snap install ripgrep --classic

# adds github projects
mkdir .source
cd .source
git clone https://github.com/baskerville/bspwm
git clone https://github.com/baskerville/sxhkd
git clone --depth 1 https://github.com/junegunn/fzf.git
git clone https://github.com/polybar/polybar
## Installs bspwm
cd bspwm
make
sudo make install
sudo cp contrib/freedesktop/bspwm.desktop /usr/share/xsessions/
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
cd ../sxhkd
make
sudo make install
cd ../fzf
./install
# polybar
cd ~/.source/polybar
bash build.sh
# neovim
cd ~/.config
git clone https://github.com/SimonAbrelat/VimConfig
mv VimConfig nvim

# ZSH
sudo apt install zsh
chsh -s /usr/bin/zsh $(whoami)
chsh -s /usr/bin/zsh root
cd ~.config
mkdir zsh
mkdir zsh/plugins
cd zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/romkatv/gitstatus
wget https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/LS_COLORS

# Moves config files around
cd ~/.config/dots
cp bspwmrc ~/.config/bspwm
cp sxhkdrc ~/.config/sxhkd
cp -r polybar ~/.config
cp -r scripts ~/.config
cp -r rofi ~/.config
cp -r zsh ~/.config
mv ~/.config/zsh/.zshenv $HOME

# DONE
echo "DONE"
sleep 1
reboot
