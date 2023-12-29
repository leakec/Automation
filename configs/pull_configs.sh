#!/bin/bash

cp ~/.vim/vimrc .
cp -r ~/.config/hypr .
cp ~/.config/awesome/theme.lua .
cp ~/.config/awesome/rc.lua .
cp -r ~/.config/awesome/scripts .
cp ~/.config/picom/picom.conf .
cp ~/.config/gromit-mpx.cfg .
cp -r ~/.config/zellij .
cp -r ~/.config/kitty .
cp /usr/local/share/mupen64plus/InputAutoCfg.ini .
cp ~/.config/betterlockscreenrc .
cp ~/.zshrc ./zshrc
cp ~/.ctags ./ctags
cp -r ~/.config/nvim .
cp ~/.config/screenkey.json .
cp ~/.config/rofi/*.rasi ./rofi/
cp -r ~/.config/wal .

# Not used anymore 
# dconf dump /org/gnome/terminal/ > ./gterminal.preferences
