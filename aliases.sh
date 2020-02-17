alias sinstall='sudo apt-get install'
alias supdate='sudo apt-get update'
alias supgrade='sudo apt-get upgrade'
alias sapt-get='sudo apt-get'
alias l='ls -1F'
alias lll='ls -alh'

alias nrestart='service network-manager restart'
alias ndc='nipype_display_crash'

alias sshmscpy="sshpass -p 'LrPbbK' ssh mutokukai.ru 'python' <"
alias sshmsc="sshpass -p 'LrPbbK' ssh mutokukai"
alias sshautrs="sshmsc -t 'cd /net/server/data/home/meg/DMALT/aut_rs; bash -l'"
alias port_fwd_nb='ssh -N -f -L localhost:8889:localhost:8889 LKJ006'

alias mnd='matlab -nodesktop -nosplash'

alias py2='/home/dmalt/anaconda/bin/python'
alias ipy2='/home/dmalt/anaconda/bin/ipython'

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
alias viterm="nvim +star -c 'term' -c 'colorscheme twilight256'"
alias du='echo REMINDER: USE ncdu!; du'
alias ncdu="ncdu --color dark -x --exclude .git --exclude node_modules"
alias man='echo echo REMINDER: USE tldr!; man'
alias locate='echo REMINDER: USE fd!; locate'

alias lf='ls -d `ls -1t | head -1`'
alias lfd='echo ~/Downloads/`ls -1t ~/Downloads | head -1`'
function mlfd(){
    mv "`lfd`" $1
}
# alias cat='echo REMINDER: USE bat!; cat'

alias cwd='pwd | xclip'
alias pp='ping -c3 -4 ya.ru'
alias kk='ll'

alias wpd='pwd'
function mcd(){
    mkdir $1
    cd $1
}

alias archie='screenfetch'

function ev(){
    evince $1 &
}

alias untar='tar -xvf'
alias агсл='fuck'

alias cels='conda env list'
function cerm(){
    conda remove -n $1 --all --yes 1>/dev/null
}
alias ca='conda activate'
alias cac='conda activate cogni; cd $HOME/Code/python/cognigraph'
alias ra='ranger'

alias ipe='curl ipinfo.io/ip'
alias ipi="ip addr show dev wlp2s0"

alias mne_open="ipython -i ~/Code/python/CLI/open_raw.py"
alias ya="yandex-disk"
alias yast="yandex-disk status"
