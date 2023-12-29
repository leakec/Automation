#!/bin/bash

# Awesome
mkdir -p ~/.config/awesome/ && cp theme.lua ~/.config/awesome/ && cp rc.lua ~/.config/awesome/ && cp -r awesome-copycats/* ~/.config/awesome && cp -r awesome_scripts ~/.config/awesome/scripts/

# Picom
mkdir -p ~/.config/picom && cp picom.conf ~/.config/picom/picom.conf

# Lock screen
cp ./betterlockscreenrc ~/.config/betterlockscreenrc

# Tmux
mkdir -p ~/.tmux/plugins/tmux
cp tmux.conf ~/.tmux.conf
rsync -r tmux/plugins/tmux/ ~/.tmux/plugins/tmux/

# Zellij
rsync -r zellij/ ~/.config/zellij

# Kitty
rsync -r kitty/ ~/.config/kitty

# Zsh
cp ./zshrc ~/.zshrc

# Neovim
rsync -r nvim/ ~/.config/nvim

# Vim
mkdir -p ~/.vim/ && cp vimrc ~/.vim/vimrc
cp ./ctags ~/.ctags

# Rofi
cp ./rofi/* ~/.config/rofi

# Wal (pywal)
cp -r ./wal/* ~/.config/wal

# Extras
cp gromit-mpx.cfg ~/.config/gromit-mpx.cfg
cp InputAutoCfg.ini /usr/local/share/mupen64plus/InputAutoCfg.ini
cp screenkey.json ~/.config/screenkey.json


# Not used anymore
# cat ./gterminal.preferences | dconf load /org/gnome/terminal/legacy/profiles:/
#mkdir -p ~/.config/alacritty/ && cp alacritty.yml ~/.config/alacritty/alacritty.yml
