#!/bin/bash

CONFIG_FILES="$HOME/.config/hypr/dunst/dunstrc_partial $HOME/.cache/wal/colors.sh"

trap "killall dunst" EXIT

# Generate the dunstrc config file from the partial + pywal colors
generate_config ()
{
    . $HOME/.cache/wal/colors.sh
    cp $HOME/.config/hypr/dunst/dunstrc_partial $HOME/.config/hypr/dunst/dunstrc

cat << EOF >> $HOME/.config/hypr/dunst/dunstrc
    # Defines color of the frame around the notification window.
    frame_color = "${cursor}"
    separator_color = "${foreground}"

[urgency_low]
    # IMPORTANT: colors have to be defined in quotation marks.
    # Otherwise the "#" and following would be interpreted as a comment.
    background = "${color0}"
    foreground = "${color1}"
    timeout = 10
    # Icon for notifications with low urgency, uncomment to enable
    #default_icon = /path/to/icon

[urgency_normal]
    background = "${background}"
    foreground = "${foreground}"
    timeout = 10
    # Icon for notifications with normal urgency, uncomment to enable
    #default_icon = /path/to/icon

[urgency_critical]
    background = "${color15}"
    foreground = "${color14}"
    timeout = 0
    # Icon for notifications with critical urgency, uncomment to enable
    #default_icon = /path/to/icon
EOF
}

while true; do
    # Generate the config
    generate_config

    # Run dunst using the given config and colors
    dunst -config $HOME/.config/hypr/dunst/dunstrc &

    # Reload when one of the config files changes. This will trigger
    # if we manually change a file or when wal changes the colors.sh
    # file on a new desktop.
    inotifywait -e create,modify $CONFIG_FILES

    # Remove other dunst instances before firing new ones.
    killall dunst

done
