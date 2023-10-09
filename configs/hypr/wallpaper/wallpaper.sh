#!/bin/bash

if ! test -f /tmp/swww_pics.txt; then
    python sort_wallpaper.py
fi

swww img ~/Pictures/Wallpapers/Dark_forest_1.jpg --transition-type outer --transition-pos 0.584,0.977 --transition-step 90
