
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pure_dmalt"
# Add wisely, as too many plugins slow down shell startup.
plugins=(git pip python web-search vi-mode cp colorize zsh-autosuggestions z safe-paste zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ------------ My changes -------- #
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey jk vi-cmd-mode

export FREESURFER_HOME=/usr/local/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh >> /dev/null

source "$HOME/dotfiles/aliases.sh" # < ---- MY ALIASES
source "$HOME/dotfiles/functions.sh"

export PATH="/usr/local/MATLAB/R2016a/bin:$PATH"
export PATH="/usr/local/MATLAB/R2016a/bin/glnxa64:$PATH"

export PATH=$PATH:/home/dmalt/Desktop/mendeleydesktop-1.16.3-linux-x86_64/bin
export PATH=$HOME/anaconda2/bin:$PATH
export PATH=$HOME/anaconda3/bin:$PATH

export LD_LIBRARY_PATH=/opt/OpenBLAS/lib:/opt/OpenBLAS/lib
export PATH=$HOME/anaconda/bin:$PATH

# export TZ=Europe/Moscow
# export TZ=America/Montreal
export TZ=Europe/Moscow

export SCRIPTS_DIR=$HOME/Dropbox/scripts

# ----- Change cursor in vi insert mode to vert. line --- #
zle-keymap-select () {
    if [ "$TERM" = "xterm-256color" ]; then
        if [ $KEYMAP = vicmd ]; then
            # the command mode for vi
            echo -ne "\e[2 q"
        else
            # the insert mode for vi
            echo -ne "\e[5 q"
        fi
    fi
}

zle-line-init () {
  zle -K viins
  # echo -ne "\033]12;Grey\007"
}
zle -N zle-keymap-select
zle -N zle-line-init
# --------------------------------------------- #
#
if [ -f ~/.zshrc_local ]; then
    source $HOME/.zshrc_local
fi
