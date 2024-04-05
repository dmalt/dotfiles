#!/usr/bin/env sh
export DOTFILES="$HOME/.dotfiles"

ln -sfv "$DOTFILES/gitconfig"             "$HOME/.gitconfig"
ln -sfv "$DOTFILES/zshrc"                 "$HOME/.zshrc"
ln -sfv "$DOTFILES/pure_dmalt.zsh-theme"  "$HOME/.oh-my-zsh/themes/pure_dmalt.zsh-theme"
ln -sfv "$DOTFILES/xinputrc"              "$HOME/.xinputrc"
ln -sfv "$DOTFILES/zlogin"                "$HOME/.zlogin"

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

if [ -L "$HOME/.config/ranger" ] || [ -d "$HOME/.config/ranger" ]
then
    rm -r "$HOME/.config/ranger"
fi
ln -sfv "$DOTFILES/ranger"              "$HOME/.config/ranger"
