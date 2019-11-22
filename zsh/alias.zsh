# ALIASES
alias v='nvim'
alias ins='sudo apt install'
alias ls='ls --color=auto'
alias pi='ping 8.8.8.8'
alias fetch='bash ~/.config/scripts/fetch'

#cancer for school
alias java_fx='java --module-path /home/simon/Documents/School/Year_1/CS1331/javafx/lib --add-modules javafx.controls'
alias javac_fx='javac --module-path /home/simon/Documents/School/Year_1/CS1331/javafx/lib --add-modules=javafx.controls'



# FUNCTIONS
function cycle (){
    nmcli connection down $1
    nmcli connection up $1
}

function z(){ zathura $1 & }
