#!/usr/bin/env zsh
respond=$(echo "---------------- Yes ----------------\n-------------- Restart --------------\n---------------- Nah ----------------" | fuzzel --dmenu)
if [ $respond = '---------------- Yes ----------------' ]
then
echo "shutdown"
shutdown now
elif [ $respond = '-------------- Restart --------------' ]
then
echo "restart"
reboot
else
notify-send "cancel shutdown"
fi