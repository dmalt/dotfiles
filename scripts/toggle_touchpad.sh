#!/bin/bash

tpad_id=`xinput | grep Touchpad | sed -E 's/.*id=([0-9]+).*/\1/'`
state=`xinput list-props $tpad_id | grep 'Device Enabled' | sed -E 's/.*([0,1])$/\1/'`
if [[ $state -eq 1 ]]; then 
    xinput --disable $tpad_id
else
    xinput --enable $tpad_id
fi

