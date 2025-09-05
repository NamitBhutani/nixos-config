#!/usr/bin/env bash

response=$(printf "Yes\nRestart\nNah" | fuzzel --dmenu)

case "$response" in
    "Yes")
        hyprctl dispatch exit &
        sleep 1
        shutdown now
        ;;
    "Restart")
        hyprctl dispatch exit &
        sleep 1
        reboot
        ;;
    *)
        notify-send "Cancelled shutdown"
        ;;
esac
