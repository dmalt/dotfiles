
# Path to your oh-my-zsh installation.
export ZSH=/home/dmalt/.oh-my-zsh
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pure_dmalt"
# Add wisely, as too many plugins slow down shell startup.
plugins=(git pip python web-search vi-mode cp colorize zsh-autosuggestions z safe-paste zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ------------ My changes -------- #
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

export FREESURFER_HOME=/usr/local/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh >> /dev/null

source ~/dotfiles/aliases # < ---- MY ALIASES

export PATH="/usr/local/MATLAB/R2016a/bin:$PATH"
export PATH="/usr/local/MATLAB/R2016a/bin/glnxa64:$PATH"

export PATH=$PATH:/home/dmalt/Desktop/mendeleydesktop-1.16.3-linux-x86_64/bin
export PATH=/home/dmalt/anaconda2/bin:$PATH

export LD_LIBRARY_PATH=/opt/OpenBLAS/lib:/opt/OpenBLAS/lib
export PATH=~/anaconda/bin:$PATH

# export TZ=Europe/Moscow
# export TZ=America/Montreal
export TZ=Europe/Moscow

export SCRIPTS_DIR=~/Dropbox/scripts


if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
