#!/usr/bin/env sh

install_url='https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh'

bash -c "$(wget $install_url -O -)"

highlight_dir="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" 
highlight_git_url='https://github.com/zsh-users/zsh-syntax-highlighting.git'
autosuggestions_dir="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" 
autosuggestions_git_url="https://github.com/zsh-users/zsh-autosuggestions"

if [ ! -d "$highlight_dir" ]
then
    git clone "$highlight_git_url" "$highlight_dir"
fi

if [ ! -d "$autosuggestions_dir" ]
then
    git clone "$autosuggestions_git_url" "$autosuggestions_dir"
fi
