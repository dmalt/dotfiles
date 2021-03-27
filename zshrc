
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export DOTFILES=$HOME/.dotfiles
export DOTFILES_LOCAL=$HOME/.dotfiles_local
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pure_dmalt"
# ZSH_THEME="refined"
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git pip python web-search vi-mode cp colorize zsh-autosuggestions z safe-paste zsh-syntax-highlighting)
plugins=(git pip python web-search cp colorize zsh-autosuggestions z safe-paste zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ------------ My changes -------- #
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# bindkey jk vi-cmd-mode

export FREESURFER_HOME=/usr/local/freesurfer
if [[ -d $FREESURFER_HOME ]]; then
	source $FREESURFER_HOME/SetUpFreeSurfer.sh  >> /dev/null
fi

source "$DOTFILES/aliases.sh" # < ---- MY ALIASES
source "$DOTFILES/functions.sh"

export PATH="/usr/local/MATLAB/R2018a/bin:$PATH"
export PATH="/usr/local/MATLAB/R2018a/bin/glnxa64:$PATH"
export PATH="/home/dmalt/.gem/ruby/2.4.0/bin/:$PATH"

export PATH=$PATH:/home/dmalt/Desktop/mendeleydesktop-1.16.3-linux-x86_64/bin
# export PATH=$HOME/anaconda2/bin:$PATH
# export PATH=$HOME/anaconda3/bin:$PATH
export PATH=$HOME/Code/bash/todotxt:$PATH
# export PATH=$HOME/miniconda3/bin:$PATH

export LD_LIBRARY_PATH=/opt/OpenBLAS/lib:/opt/OpenBLAS/lib
# export PATH=$HOME/miniconda3/bin:$PATH
export PATH=$PATH:$HOME/.Programs/Telegram
export EDITOR=nvim
# export VISUAL=nvr
export NVIM_TUI_ENABLE_TRUE_COLOR=1
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)

# PM functions
# source ~/.pm/pm.zsh
# alias pma="pm add"
# alias pmg="pm go"
# alias pmrm="pm remove"
# alias pml="pm list"
# end PM

# source ~/.zplug/init.zsh
# zplug "changyuheng/fz", defer:1
# zplug "rupa/z", use:z.sh
# export BORG_REPO='/run/media/dmalt/my_passport/kulyoma1_home_backups/'
export BORG_REPO='/media/dmalt/my_passport/kulyoma1_home_backups/'
export BORG_PASSPHRASE='aikbkj'


# >>> conda initialize >>>
export PYTHONNOUSERSITE=True  # dont include local packages to virtual envs
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dmalt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dmalt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dmalt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dmalt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# export PATH="/usr/share/terminfo/l:$PATH"
# export PATH="/usr/share/terminfo/x:$PATH"
# <<< conda initialize <<<

bindkey '^l' autosuggest-accept # map ctrl+l to accept zsh autosuggestions

if [ -f $DOTFILES_LOCAL/zshrc_local ]; then
    source $DOTFILES_LOCAL/zshrc_local
fi


# fix not working delete key for st terminal
function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish

# PATH="/home/dmalt/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/dmalt/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/dmalt/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/dmalt/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/dmalt/perl5"; export PERL_MM_OPT;
