#/bin.bash
c=$HOME/.config
d=$c/Dots
cp -r $d/zathura $c
cp -r $d/scripts $c
cp -r $d/rofi $c
cp -r $d/zsh $c
mkdir -p $c/alacritty
cp $d/alacritty.yml $c/alacritty

# zsh plugins
if [ ! -d $c/zsh/plugins ]; then
    curr=${pwd}
    mkdir -p $c/zsh/plugins
    cd $c/zsh/plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting
    git clone https://github.com/romkatv/gitstatus
    wget https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/LS_COLORS
    cd $curr
fi

echo "PUSHED!"
