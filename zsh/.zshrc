# Luke's config for the Zoomer Shell
source $ZDOTDIR/plugins/gitstatus/gitstatus.prompt.zsh
# Enable colors and change prompt:
autoload -U colors && colors
PROMPT='%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%1d%b $GITSTATUS_PROMPT$ '

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$ZDOTDIR/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d $ZDOTDIR/comp
_comp_options+=(globdots) # Include hidden files.

#—————————————————— History completion —
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "\eOA" up-line-or-beginning-search # Up
bindkey "\eOB" down-line-or-beginning-search # Down

# autojump
source /usr/share/autojump/autojump.sh

# Load aliases and shortcuts if existent.
source $ZDOTDIR/alias.zsh

# colorful ls
eval $( dircolors -b $ZDOTDIR/plugins/LS_COLORS)

# Load zsh-syntax-highlighting; should be last.
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Path variables
export PATH=$HOME/.local/bin:$PATH
