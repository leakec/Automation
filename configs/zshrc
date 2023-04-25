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

## Setup PSI
#export PROMPT='%F{red}%n%f@%F{magenta}%m:%F{#350480}%~%f$ '
export PROMPT='%F{#6C71C4}[%2d]$%f '

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## Key bindings
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
# In tmux
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

## No duplicate history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt noincappendhistory # Does not share between tmux panes
setopt nosharehistory # Does not share between tmux panes 
#setopt hist_ignore_all_dups
#setopt hist_save_no_dups
setopt hist_ignore_dups # Removes subsequent dupes
#setopt hist_find_no_dups

## Set keyboard repeat rate
xset r rate 150 30

## User-specific commands
# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$PATH"
fi
export PATH

export EDITOR='nvim'
export SVN_EDITOR='nvim'

source ~/.zshrc_darts
