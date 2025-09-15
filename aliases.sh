#!/bin/bash
alias vi=nvim
alias history='fc -l -E 1'
alias vi='nvim'
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias du='echo REMINDER: USE ncdu!; du'
alias ncdu="ncdu --color dark -x --exclude .git --exclude node_modules"

alias lf='ls -d `ls -1t | head -1`'
alias lfd='echo ~/Downloads/`ls -1t ~/Downloads | head -1`'

function mlfd {
    mv "`lfd`" $1
}


alias pp='ping -c3 google.com'


function mcd(){
    mkdir $1
    cd $1
}


alias ipe='curl ipinfo.io/ip'
alias ipi="ip addr show dev wlp2s0"

alias df='df -x"squashfs"'
alias llh='ll -t | head'
alias kivi='NVIM_APPNAME="kickstart.nvim" nvim'
alias gt='cd `git rev-parse --show-toplevel`'
