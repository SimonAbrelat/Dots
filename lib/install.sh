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
sudo apt install python3-pip
sudo apt install alacritty rofi fonts-firacode autojump zathura zathura-pdf-poppler
# pip
pip3 install pynvim
# snap
snap install spotify
snap install ripgrep --classic
# adds github projects
mkdir .source
cd .source
git clone --depth 1 https://github.com/junegunn/fzf.git
cd ../fzf
./install
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
cd ~/config/Dots
mkdir -p ~/.config/alacritty
cp alacritty.yml ~/.config/alacritty
cp -r scripts ~/.config
cp -r rofi ~/.config
cp -r zsh ~/.config
cp -r zathura ~/.config
sudo mv ~/.config/zsh/zshenv /etc/zsh/zshenv

# DONE
echo "INSTALLED"
