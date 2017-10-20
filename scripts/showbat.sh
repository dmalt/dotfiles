#!/usr/bin/zsh

bname=$(upower -e | grep BAT)
percentage=`upower -i $bname | grep percentage | sed -E 's/.*\s([0-9]{1,2}%)/\1/'`
time2full=`upower -i $bname | grep 'time to full' | sed -E 's/.*\s([0-9\.]+\s[a-z])/\1/'`
energyrate=`upower -i $bname | grep 'energy-rate' | sed -E 's/.*\s([0-9\.]+\sW)/\1/'`
time2empty=`upower -i $bname | grep 'time to empty' | sed -E 's/.*\s([0-9\.]+\s[a-z])/\1/'`
state=`upower -i $bname | grep  'state' | sed -E 's/.*\s(charging|discharging)/\1/'`


if [[ "$state" == "discharging" ]]; then
    status_str=("$percentage" \("$time2empty" left\); discharge rate: "$energyrate")
elif [[ "$state" == "charging" ]]; then 
    if [[ "$time2full" ]]; then
        ttf_str=(\("$time2full" to full\))
    fi
    status_str=("$percentage" $ttf_str; charging rate: "$energyrate")
fi

echo $status_str
