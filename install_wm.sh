# bspwm
sudo apt install xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev
sudo apt install libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev gcc make
sudo apt install libxcb-shape0-dev
# polybar
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev
sudo apt install libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev
sudo apt install libxcb-icccm4-dev libcurl4-openssl-dev
# adds github projects
mkdir .source
cd .source
git clone https://github.com/baskerville/bspwm
git clone https://github.com/baskerville/sxhkd
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

# Moves config files around
cd ~/config/Dots
mkdir -p ~/.config/sxhkd
mkdir -p ~/.config/bspwm
cp bspwmrc ~/.config/bspwm
cp sxhkdrc ~/.config/sxhkd
cp -r polybar ~/.config
