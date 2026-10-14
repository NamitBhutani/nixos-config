#!/usr/bin/env bash

panel_conf="${XDG_CACHE_HOME:-$HOME/.cache}/hypr/panel-rate.conf"
previous_status=""
grep -q '@240,' "$panel_conf" 2>/dev/null && previous_status=1
grep -q '@151,' "$panel_conf" 2>/dev/null && previous_status=0

apply() {
    local current_status rule
    read -r current_status </sys/class/power_supply/ADP1/online 2>/dev/null || return
    [[ $current_status == "$previous_status" ]] && return
    if [[ $current_status == 1 ]]; then
        rule="desc:Sharp Corporation LQ173M1JW05,1920x1080@240,1920x0,1.00"
    else
        rule="desc:Sharp Corporation LQ173M1JW05,1920x1080@151,1920x0,1.00"
    fi
    hyprctl keyword monitor "$rule"
    echo "monitor = $rule" >"$panel_conf"
    previous_status=$current_status
}

apply
while true; do
    udevadm monitor --udev --subsystem-match=power_supply | while read -r _; do apply; done
    sleep 5
done
