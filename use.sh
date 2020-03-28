dots=$HOME/.config/Dots

manager () {
    for ((i=2; i<=$#; i++)); do
        bash $dots/wms/${!i}/$1_${!i}.sh
    done;
}

case "${1}" in
    update) bash $dots/lib/clean.sh
            manager clean ${@:3}
            bash $dots/lib/push.sh
            manager push ${@:2}
    ;;
    clean | push | save | install ) bash $dots/lib/$1.sh
                                    manager $1 ${@:2}
    ;;
    manage ) manager $2 ${@:3}
    ;;
    *) echo "The possible commands are:
    update: sets the current config to Dots
    clean: remove current config
    push: push Dots to the config
    save: saves the config to Dots
    install: install the base config
    manage: run one of the prior command but only for a particular window manager

After that command enter all window managers you would like to affect"
    ;;
esac
