
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export DOTFILES=$HOME/.dotfiles
export DOTFILES_LOCAL=$HOME/.dotfiles_local
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pure_dmalt"
# ZSH_THEME="refined"
# Add wisely, as too many plugins slow down shell startup.
plugins=(git pip python web-search vi-mode cp colorize zsh-autosuggestions z safe-paste zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ------------ My changes -------- #
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# bindkey jk vi-cmd-mode

# export FREESURFER_HOME=/usr/local/freesurfer
# source $FREESURFER_HOME/SetUpFreeSurfer.sh  >> /dev/null

source "$DOTFILES/aliases.sh" # < ---- MY ALIASES
source "$DOTFILES/functions.sh"

export PATH="/usr/local/MATLAB/R2017a/bin:$PATH"
export PATH="/usr/local/MATLAB/R2017a/bin/glnxa64:$PATH"
export PATH="/home/dmalt/.gem/ruby/2.4.0/bin/:$PATH"

export PATH=$PATH:/home/dmalt/Desktop/mendeleydesktop-1.16.3-linux-x86_64/bin
export PATH=$HOME/anaconda2/bin:$PATH
export PATH=$HOME/anaconda3/bin:$PATH
export PATH=$HOME/Code/bash/todotxt:$PATH
# export PATH=$HOME/miniconda3/bin:$PATH

export LD_LIBRARY_PATH=/opt/OpenBLAS/lib:/opt/OpenBLAS/lib
export PATH=$HOME/anaconda/bin:$PATH
export PATH=$PATH:$HOME/.Programs/Telegram
export EDITOR=nvim

# export TZ=America/Montreal
export TZ=Europe/Moscow

export SCRIPTS_DIR=$HOME/Dropbox/scripts

# # ----- Change cursor in vi insert mode to vert. line --- #
# zle-keymap-select () {
#     if [ "$TERM" = "xterm-256color" ]; then
#         if [ $KEYMAP = vicmd ]; then
#             # the command mode for vi
#             echo -ne "\e[2 q"
#         else
#             # the insert mode for vi
#             echo -ne "\e[5 q"
#         fi
#     fi
# }

# zle-line-init () {
#   zle -K viins
#   # echo -ne "\033]12;Grey\007"
# }
# zle -N zle-keymap-select
# zle -N zle-line-init
# # --------------------------------------------- #
#
if [ -f $DOTFILES_LOCAL/zshrc_local ]; then
    source $DOTFILES_LOCAL/zshrc_local
fi
