#!/usr/bin/env bash

export STATUS_FILE="$HOME/.keyboard_status"

enable_keyboard() {
    printf "1" >"$STATUS_FILE"
    notify-send -u normal "Enabling Keyboard"
    hyprctl keyword '$LAPTOP_KB_ENABLED' 1 -r
}

disable_keyboard() {
    printf "0" >"$STATUS_FILE"
    notify-send -u normal "Disabling Keyboard"
    hyprctl keyword '$LAPTOP_KB_ENABLED' 0 -r
}

if ! [ -f "$STATUS_FILE" ]; then
  enable_keyboard
else
  if [ $(cat "$STATUS_FILE") = 1 ]; then
    disable_keyboard
  elif [ $(cat "$STATUS_FILE") = 0 ]; then
    enable_keyboard
  fi
fi
