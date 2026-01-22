#!/usr/bin/env sh
export DOTFILES="$HOME/.dotfiles"

ln -sfv "$DOTFILES/gitconfig"             "$HOME/.gitconfig"
ln -sfv "$DOTFILES/zshrc"                 "$HOME/.zshrc"
ln -sfv "$DOTFILES/zlogin"                "$HOME/.zlogin"

mkdir -p $HOME/.config

if [ -L "$HOME/.config/nvim" ] || [ -d "$HOME/.config/nvim" ]
then
    rm -r "$HOME/.config/nvim"
fi
ln -sfv "$DOTFILES/nvim" "$HOME/.config/nvim"

if [ -L "$HOME/.config/tmux" ] || [ -d "$HOME/.config/tmux" ]
then
    rm -r "$HOME/.config/tmux"
fi
mkdir "$HOME/.config/tmux"
ln -sfv "$DOTFILES/tmux.conf"             "$HOME/.config/tmux/tmux.conf"
