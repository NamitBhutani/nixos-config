#!/usr/bin/env bash

response=$(printf "Yes\nRestart\nNah" | fuzzel --dmenu)

case "$response" in
    "Yes")
        shutdown now
        ;;
    "Restart")
        reboot
        ;;
    *)
        notify-send "Cancelled shutdown"
        ;;
esac
