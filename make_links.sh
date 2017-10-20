if ! [[ -d $HOME/.i3 ]]; then
    ln -sv $HOME/dotfiles/.i3/ $HOME/.config/i3
fi

if ! [[ -d $HOME/.config/rofi ]]; then
    ln -sv $HOME/dotfiles/rofi/ $HOME/.config/rofi
fi

ln -sfv $HOME/dotfiles/.gitconfig             $HOME/.gitconfig
ln -sfv $HOME/dotfiles/.zshrc                 $HOME/.zshrc
ln -sfv $HOME/dotfiles/.vimrc                 $HOME/.vimrc
ln -sfv $HOME/dotfiles/.conkyrc               $HOME/.conkyrc
ln -sfv $HOME/dotfiles/.zshrc                 $HOME/.zshrc
ln -sfv $HOME/dotfiles/pure_dmalt.zsh-theme   $HOME/.oh-my-zsh/themes/pure_dmalt.zsh-theme
ln -sfv $HOME/dotfiles/.tmux.conf             $HOME/.tmux.conf
ln -sfv $HOME/dotfiles/.xinputrc              $HOME/.xinputrc
ln -sfv $HOME/dotfiles/.vimrc                 $HOME/.config/nvim/init.vim
ln -sfv $HOME/dotfiles/.zlogin                $HOME/.zlogin
