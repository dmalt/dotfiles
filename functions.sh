fwd_jupyter () { 
    echo "Forwarding $1 port on local machine to $2 port on $3"
    ssh -N -f -L "$1":localhost:"$2" "$3"
    google-chrome 127.0.0.1:"$1"
}




showbat () {
    upower -i `upower -e | grep BAT` | grep percentage
    upower -i `upower -e | grep BAT` | grep 'time to full'
}

toggle_touchpad() {
    tpad_id=`xinput | grep Touchpad | sed -E 's/.*id=([0-9]+).*/\1/'`
    state=`xinput list-props $tpad_id | grep 'Device Enabled' | sed -E 's/.*([0,1])$/\1/'`
    if [[ $state -eq 1 ]]; then 
        xinput --disable $tpad_id
    else
        xinput --enable $tpad_id
    fi
}

