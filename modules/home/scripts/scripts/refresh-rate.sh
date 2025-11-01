#!/usr/bin/env bash

previous_status=""

while true; do
    current_status=$(upower -i $(upower -e | grep 'line_power') | grep 'online' | awk '{print $2}')

    if [[ "$current_status" != "$previous_status" ]]; then
        if [[ "$current_status" == "yes" ]]; then
            hyprctl keyword monitor eDP-1,1920x1080@120,0x0,1.0  # Change refresh rate to 120 Hz when plugged in
        else
            hyprctl keyword monitor eDP-1,1920x1080@60,0x0,1.0  # Change refresh rate to 60 Hz when unplugged
        fi
        previous_status="$current_status"
    fi

    sleep 5
done
