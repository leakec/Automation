#!/bin/bash

CONFIG_FILES="$HOME/.config/hypr/waybar/config.txt $HOME/.config/hypr/waybar/style.css"

trap "killall waybar" EXIT

while true; do
    waybar -s $HOME/.config/hypr/waybar/style.css -c $HOME/.config/hypr/waybar/config.txt &
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
