#!/usr/bin/env bash

state="${XDG_RUNTIME_DIR:-/tmp}/gpu-monitor"
[[ -d $state ]] || mkdir -p "$state"

now_ms=$((${EPOCHREALTIME//[.,]/} / 1000))

readf() {
    local __l=""
    { IFS= read -r __l <"$2"; } 2>/dev/null
    printf -v "$1" '%s' "$__l"
}
isnum() { [[ $1 =~ ^[0-9]+$ ]]; }

if [[ $1 == toggle ]]; then
    readf d "$state/detail"
    if [[ $d == 1 ]]; then echo 0 >"$state/detail"; else echo 1 >"$state/detail"; fi
    exit 0
fi
readf detail "$state/detail"

intel="" nv=""
for dev in /sys/bus/pci/devices/*; do
    readf class "$dev/class"
    [[ $class == 0x03* ]] || continue
    readf vendor "$dev/vendor"
    case $vendor in
    0x8086) intel=$dev ;;
    0x10de) nv=$dev ;;
    esac
done

nv_state=absent nv_util=0 nv_used=0 nv_total=0 nv_temp="" nv_power="" nv_clock=""
if [[ -n $nv ]]; then
    readf rt "$nv/power/runtime_status"
    if [[ ! -e $nv/driver ]]; then
        nv_state=nodriver
    elif [[ $rt != active ]]; then
        nv_state=asleep
        : >"$state/nv"
    else
        pinned=0
        [[ -z $intel ]] && pinned=1
        for c in "$nv"/drm/card[0-9]*/card[0-9]*-*/status; do
            readf st "$c"
            [[ $st == connected ]] && pinned=1
        done
        streak=0 until_ms=0
        { read -r streak until_ms <"$state/nv"; } 2>/dev/null
        isnum "$streak" || streak=0
        isnum "$until_ms" || until_ms=0
        if ((!pinned && now_ms < until_ms)); then
            nv_state=idle
        else
            IFS=', ' read -r nv_util nv_used nv_total nv_temp nv_power nv_clock < <(
                timeout 2 nvidia-smi \
                    --query-gpu=utilization.gpu,memory.used,memory.total,temperature.gpu,power.draw,clocks.gr \
                    --format=csv,noheader,nounits 2>/dev/null
            )
            if isnum "$nv_util"; then
                nv_state=on
                if ((!pinned && nv_util == 0)); then
                    streak=$((streak + 1))
                    if ((streak >= 2)); then
                        streak=0
                        until_ms=$((now_ms + 20000))
                    fi
                else
                    streak=0
                fi
                printf '%s %s\n' "$streak" "$until_ms" >"$state/nv"
            else
                nv_state=error nv_util=0
            fi
        fi
    fi
fi

gib() {
    if (($1 < 1024)); then
        printf -v "$2" '%dM' "$1"
        return
    fi
    local t=$(($1 * 10 / 1024))
    printf -v "$2" '%d.%dG' $((t / 10)) $((t % 10))
}

icon="󰢮"
case $nv_state in
on)
    gib "$nv_used" used_g
    gib "$nv_total" total_g
    text="$icon ${nv_util}%"
    [[ $detail == 1 ]] && text+=" · ${used_g}/${total_g} · ${nv_temp}°C"
    tip="<b>NVIDIA</b>  ${nv_util}% · ${nv_clock} MHz\n${nv_used} / ${nv_total} MiB · ${nv_temp}°C"
    isnum "${nv_power%.*}" && tip+=" · ${nv_power%.*} W"
    ;;
asleep) text="$icon off" tip="<b>NVIDIA</b>  asleep" ;;
idle) text="$icon idle" tip="<b>NVIDIA</b>  idle" ;;
nodriver) text="$icon n/a" tip="<b>NVIDIA</b>  no driver" ;;
error) text="$icon n/a" tip="<b>NVIDIA</b>  query failed" ;;
*) text="$icon n/a" tip="<b>NVIDIA</b>  not present" ;;
esac

high=""
((nv_util >= 85)) && high=',"high"'
printf '{"text":"%s","tooltip":"%s","class":["%s"%s],"percentage":%d}\n' \
    "$text" "$tip" "$nv_state" "$high" "$nv_util"
