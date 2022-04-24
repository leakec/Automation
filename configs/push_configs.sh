#!/bin/bash

mkdir -p ~/.vim/ && cp vimrc ~/.vim/vimrc
mkdir -p ~/.config/awesome/ && cp theme.lua ~/.config/awesome/ && cp rc.lua ~/.config/awesome/
mkdir -p ~/.config/picom/picom.conf && cp picom.conf ~/.config/picom/picom.conf
cp gromit-mpx.cfg ~/.config/gromit-mpx.cfg
cp tmux.conf ~/.tmux.conf
cat ./gterminal.profiles | dconf load /org/gnome/terminal/legacy/profiles:/
cp InputAutoCfg.ini /usr/local/share/mupen64plus/InputAutoCfg.ini
