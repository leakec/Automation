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
setopt hist_find_no_dups

## Set keyboard repeat rate
xset r rate 150 30

## User-specific commands
# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$PATH"
fi
export PATH

# Use neovim for editing
export EDITOR='nvim'
export SVN_EDITOR='nvim'
export MANPAGER='nvim +Man!'
export MANWIDTH=999

## Zellij aliases
function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}
function zm () { zellij action launch-or-focus-plugin file:$HOME/.zellij_plugins/multitask.wasm --configuration "shell=$SHELL,cwd=`pwd`"}
function zff () { zellij edit -i ""; zellij action write-chars " ff"}
function zfg () { zellij edit -i ""; zellij action write-chars " fg"}
alias z="zellij options --no-pane-frames"

# Use the OSC52 escape sequence and base64 encoding to copy to system clipboard via a pipe
function copy () {echo -en "\e]52;c;$(cat $1|base64)\a" }

## Plugins
# From https://github.com/mattmc3/zsh_unplugged#jigsaw-the-humble-plugin-load-function

# where do you want to store your plugins?
ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

# get zsh_unplugged and store it with your other plugins
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

# make list of the Zsh plugins you use
repos=(
  # plugins that you want loaded first
  #sindresorhus/pure

  # other plugins
  #zsh-users/zsh-completions
  #rupa/z
  # ...
  z-shell/zsh-diff-so-fancy

  # plugins you want loaded last
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  #zsh-users/zsh-autosuggestions
)

# now load your plugins
plugin-load $repos

# Keybindings for plugins
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Source DARTS
source ~/.zshrc_darts
