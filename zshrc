# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export DOTFILES=$HOME/.dotfiles
export DOTFILES_LOCAL=$HOME/.dotfiles_local
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="pure"
ZSH_THEME=""
# Add wisely, as too many plugins slow down shell startup.
plugins=(git pip cp colorize zsh-autosuggestions safe-paste zsh-syntax-highlighting poetry docker-compose)

source $ZSH/oh-my-zsh.sh

# ------------ My changes -------- #
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search


source "$DOTFILES/aliases.sh" # < ---- MY ALIASES
source "$DOTFILES/functions.sh"

export EDITOR=nvim
export NVIM_TUI_ENABLE_TRUE_COLOR=1


[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh
[ -f ~/.fzf/shell/completion.zsh ] && source ~/.fzf/shell/completion.zsh


bindkey "^o" autosuggest-accept # map ctrl+i to accept zsh autosuggestions

export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
if [ -f $DOTFILES_LOCAL/zshrc_local ]; then
    source $DOTFILES_LOCAL/zshrc_local
fi


export PATH="/Users/dmitriialtukhov/.local/bin:$PATH"
export PATH="/Users/dmitriialtukhov/bin:$PATH"

eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export TEST=/Users/dmitriialtukhov
export TEST=$HOME

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dmitriialtukhov/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dmitriialtukhov/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dmitriialtukhov/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dmitriialtukhov/google-cloud-sdk/completion.zsh.inc'; fi

export AWS_PROFILE=dev
export HISTSIZE=1000000

fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH
# to protect history from the cleaning tools on MacOS
export HISTFILE="$HOME/.config/zsh_history"
