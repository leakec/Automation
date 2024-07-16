#!/bin/bash

FILE=$HOME/.config/hypr/waybar/waybar_state.txt

STATE=$(cat "$FILE")

if [ "$STATE" = "off" ]; then
    killall -SIGUSR2 waybar
    echo "" > $FILE
else
    killall -SIGUSR1 waybar
    echo "off" > $FILE
fi
