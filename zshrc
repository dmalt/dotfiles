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

fsf_home=$HOME/.local/freesurfer
if [[ -d $FREESURFER_HOME ]]; then
    export FREESURFER_HOME=$fsf_home
	source $FREESURFER_HOME/SetUpFreeSurfer.sh  >> /dev/null
fi

source "$DOTFILES/aliases.sh" # < ---- MY ALIASES
source "$DOTFILES/functions.sh"

export EDITOR=nvim
export NVIM_TUI_ENABLE_TRUE_COLOR=1
# export TZ=America/Montreal
# export TZ=Europe/Moscow


[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh
[ -f ~/.fzf/shell/completion.zsh ] && source ~/.fzf/shell/completion.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dmalt/Applications/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dmalt/Applications/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/dmalt/Applications/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dmalt/Applications/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

bindkey "^o" autosuggest-accept # map ctrl+i to accept zsh autosuggestions

export PATH="$HOME/.local/bin:$PATH"

if [ -f $DOTFILES_LOCAL/zshrc_local ]; then
    source $DOTFILES_LOCAL/zshrc_local
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
