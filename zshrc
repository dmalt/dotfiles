# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export DOTFILES=$HOME/.dotfiles
export DOTFILES_LOCAL=$HOME/.dotfiles_local
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pure_dmalt"
# Add wisely, as too many plugins slow down shell startup.
plugins=(tmux git pip python web-search cp colorize zsh-autosuggestions z safe-paste zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ------------ My changes -------- #
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# bindkey jk vi-cmd-mode

export FREESURFER_HOME=$HOME/.local/freesurfer
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
# export PATH=$HOME/miniconda3/bin:$PATH

# export PATH=$HOME/miniconda3/bin:$PATH
export PATH=$PATH:$HOME/.Programs/Telegram
export EDITOR=nvim
# export VISUAL=nvr
export NVIM_TUI_ENABLE_TRUE_COLOR=1
# export TZ=America/Montreal
# export TZ=Europe/Moscow

export SCRIPTS_DIR=$HOME/Dropbox/scripts


[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh
[ -f ~/.fzf/shell/completion.zsh ] && source ~/.fzf/shell/completion.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/altukhov/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/altukhov/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/altukhov/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/altukhov/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

bindkey '^l' autosuggest-accept # map ctrl+l to accept zsh autosuggestions

export PATH="/home/dmalt/.local/bin:$PATH"

if [ -f $DOTFILES_LOCAL/zshrc_local ]; then
    source $DOTFILES_LOCAL/zshrc_local
fi
