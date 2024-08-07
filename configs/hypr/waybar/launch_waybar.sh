#!/bin/bash

CONFIG_FILES="$HOME/.config/hypr/waybar/config.txt $HOME/.config/hypr/waybar/style.css $HOME/.cache/wal/colors-waybar.css"

trap "killall waybar" EXIT
STATE_FILE=$HOME/.config/hypr/waybar/waybar_state.txt

while true; do
    echo "" > $STATE_FILE
    \cp -r $HOME/.cache/wal/colors-waybar.css $HOME/.config/hypr/waybar &
    waybar -c $HOME/.config/hypr/waybar/config.txt -s $HOME/.config/hypr/waybar/style.css &
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
