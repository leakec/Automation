#!/bin/bash

cp ~/.vim/vimrc .
cp -r ~/.config/hypr .
cp ~/.config/awesome/theme.lua .
cp ~/.config/awesome/rc.lua .
cp ~/.config/picom/picom.conf .
cp ~/.config/gromit-mpx.cfg .
cp ~/.tmux.conf ./tmux.conf
cp -r ~/.config/zellij .
mkdir -p ./tmux/plugins/tmux
rsync -r ~/.tmux/plugins/tmux/ tmux/plugins/tmux/
cp -r ~/.config/kitty .
cp /usr/local/share/mupen64plus/InputAutoCfg.ini .
cp ~/.config/betterlockscreenrc .
cp ~/.zshrc ./zshrc
cp ~/.ctags ./ctags
cp -r ~/.config/nvim .
cp ~/.config/screenkey.json .

# Not used anymore 
# dconf dump /org/gnome/terminal/ > ./gterminal.preferences
