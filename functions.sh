fwd_jupyter () { 
    echo "Forwarding $1 port on local machine to $2 port on $3"
    ssh -N -f -L "$1":localhost:"$2" "$3"
    google-chrome 127.0.0.1:"$1"
}


killname () {
    kill `pgrep $1`
}
