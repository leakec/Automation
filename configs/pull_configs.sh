#!/bin/bash

cp ~/.vim/vimrc .
cp ~/.config/awesome/* .
cp ~/.config/picom/picom.conf .
cp ~/.config/gromit-mpx.cfg .
cp ~/.tmux.conf ./tmux.conf
dconf dump /org/gnome/terminal/ > ./gterminal.preferences
cp /usr/local/share/mupen64plus/InputAutoCfg.ini .
cp ~/.xscreensaver ./xscreensaver
cp ~/.zshrc ./zshrc
cp ~/.ctags ./ctags
cp -r ~/.config/nvim .
