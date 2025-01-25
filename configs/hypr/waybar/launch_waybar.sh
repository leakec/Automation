#!/bin/bash

CONFIG_FILES="$HOME/.config/hypr/waybar/configs $HOME/.config/hypr/waybar/style.css $HOME/.cache/wal/colors-waybar.css"

trap "killall waybar" EXIT
STATE_FILE=$HOME/.config/hypr/waybar/waybar_state.txt

config_file=$HOME/.config/hypr/waybar/config
if [ ! -f $config_file ]; then
    ln -sf $HOME/.config/hypr/waybar/configs/main $config_file
fi

style_file=$HOME/.config/hypr/waybar/style.css 
if [ ! -f $style_file ]; then
    ln -sf $HOME/.config/hypr/waybar/styles/main.css $style_file
fi

while true; do
    echo "" > $STATE_FILE
    \cp -r $HOME/.cache/wal/colors-waybar.css $HOME/.config/hypr/waybar &
    waybar -c $HOME/.config/hypr/waybar/config -s $HOME/.config/hypr/waybar/style.css &
    inotifywait -e attrib,modify $CONFIG_FILES
    killall waybar
done
