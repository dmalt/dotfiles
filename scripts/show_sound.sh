#!/bin/bash

amixer_str=$(amixer | grep 'Left: Playback')
vol=$(echo $amixer_str | sed -E 's/.*\[([0-9]{1,3}%)\].*/\1/g')
is_on=$(echo $amixer_str | sed -E 's/.*\[(on|off)\].*/\1/g')
mute_icon=
mute_str=''
if [[ "$is_on" = "off" ]]; then
   mute_str=$mute_icon 
fi

echo $vol $mute_str
# instance=IEC958
# level=$(amixer | grep Left
