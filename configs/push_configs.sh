#!/bin/bash

# Hypr
rsync -r hypr/ ~/.config/hypr

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
mkdir -p ~/.config/rofi
cp ./rofi/* ~/.config/rofi

# Wal (pywal)
cp -r ./wal/* ~/.config/wal

# Extras
cp gromit-mpx.cfg ~/.config/gromit-mpx.cfg
cp InputAutoCfg.ini /usr/local/share/mupen64plus/InputAutoCfg.ini
cp screenkey.json ~/.config/screenkey.json
