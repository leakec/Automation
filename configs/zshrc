# Created by newuser for 5.8.1
#

## tab-completion settings

# Setup completion menu
zstyle ':completion:*' menu select
zmodload zsh/complist

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz compinit
compinit

## Setup coloring
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

## Key bindings
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

## User-specific commands
# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export EDITOR='vim'
export SVN_EDITOR='vim'
#alias vim=vimx

# DARTS stuff
alias srun=~/Documents/JplDartsLab/dlabrun
export YAM_PROJECT_CONFIG_DIR=~/Documents/JplDartsLab/yam
export YAM_PROJECT=Dshell
export SITECONFIGDIR=~/Documents/JplDartsLab/siteconfigs 
export TPS_DEPLOY_DIR=~/Documents/JplDartsLab/TPS
export YAM_TARGET=x86_64-fedora34-linux
#source ~/Documents/eelsPkg/src/DshellEnv/srun-complete.zsh

