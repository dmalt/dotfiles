#!/bin/bash
alias sinstall='sudo apt-get install'
alias supdate='sudo apt-get update'
alias supgrade='sudo apt-get upgrade'
alias sapt-get='sudo apt-get'
alias l='ls -1F'
alias lll='ls -alh'

alias vi=nvim
alias history='fc -l -E 1'
# alias stats='cd ~/Dropbox/Documents/Education/MEG/Books && evince Statistical*'
alias telegram='Telegram'
alias vi='nvim'
alias t='todo.sh'
alias tmux='TERM=screen-256color-bce tmux'
# alias ipython='ipython --gui=qt'
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias bst='mnd -r brainstorm'
# alias vim='nvim'
alias du='echo REMINDER: USE ncdu!; du'
alias ncdu="ncdu --color dark -x --exclude .git --exclude node_modules"
alias man='echo echo REMINDER: USE tldr!; man'
alias locate='echo REMINDER: USE fd!; locate'

alias lf='ls -d `ls -1t | head -1`'
alias lfd='echo ~/Downloads/`ls -1t ~/Downloads | head -1`'

function mlfd {
    mv "`lfd`" $1
}


alias cwd='pwd | xclip'
alias pp='ping -c3 -4 ya.ru'
alias kk='ll'

alias wpd='pwd'

function mcd(){
    mkdir $1
    cd $1
}

alias archie='screenfetch'

alias untar='tar -xvf'

alias ca='conda activate'
alias ra='ranger'

alias ipe='curl ipinfo.io/ip'
alias ipi="ip addr show dev wlp2s0"

alias ya="yandex-disk"
alias yast="yandex-disk status"
alias df='df -x"squashfs"'
alias llh='ll -t | head'
alias kivi='NVIM_APPNAME="kickstart.nvim" nvim'
alias icat='kitten icat'
