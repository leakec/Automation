# Created by newuser for 5.8.1
#

## tab-completion settings

# Setup completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zmodload zsh/complist

# use the vi navigation keys in menu completion
# and vi mode in the terminal
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v

autoload -Uz compinit
compinit

## Setup coloring
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
# Setup ls aliases
if type eza &> /dev/null; then
    # Exa exists in the path. Use that instead of ls
    alias ls="eza"
    alias ll="eza -alF"
else
    # Fallback to using ls
    alias ls='ls --color=auto'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
fi

## Setup PSI
#export PROMPT='%F{red}%n%f@%F{magenta}%m:%F{#350480}%~%f$ '
export PROMPT='%F{#6C71C4}[%2d]$%f '

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
function zm () { zellij action start-or-reload-plugin file:$HOME/.zellij_plugins/multitask.wasm --configuration "shell=$SHELL,cwd=`pwd`" }
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
  joshskidmore/zsh-fzf-history-search

  # plugins you want loaded last
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  #zsh-users/zsh-autosuggestions
)

# now load your plugins
if type "plugin-load" > /dev/null; then
    plugin-load $repos

    # Keybindings for plugins
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    
    # Initialize zoxide
    if [ -x "$(command -v zoxide)" ]; then
        eval "$(zoxide init --cmd cd zsh)"
    fi
    
    # Initialize fzf
    if [ -x "$(command -v fzf)" ]; then
        source /usr/share/fzf/shell/key-bindings.zsh
        source /usr/share/zsh/site-functions/fzf
    fi
    
    # Use fd instead of fzf
    export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
    
    # Use fd for listing path candidates.
    # - The first argument to the function ($1) is the base path to start traversal
    # - See the source code (completion.{bash,zsh}) for the details.
    _fzf_compgen_path() {
      fd --hidden --exclude .git . "$1"
    }
    
    # Use fd to generate the list for directory completion
    _fzf_compgen_dir() {
      fd --type=d --hidden --exclude .git . "$1"
    }
fi

# Source cargo
if [ -f $HOME/.cargo/env ]; then
    source "$HOME/.cargo/env"
fi

# Source DARTS
source ~/.zshrc_darts
