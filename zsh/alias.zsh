# ALIASES
alias v='nvim'
alias ins='sudo apt install'
alias ls='ls --color=auto'
alias pi='ping 8.8.8.8'
alias fetch='bash ~/.config/scripts/fetch'

# FUNCTIONS
function cycle (){
    nmcli connection down $1
    nmcli connection up $1
}

function z(){ zathura $1 & }
