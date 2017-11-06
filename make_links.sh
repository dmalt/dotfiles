export DOTFILES=$HOME/.dotfiles
if ! [[ -d $HOME/.config/i3 ]]; then
    ln -sv $DOTFILES/.i3 $HOME/.config/i3
fi

mkdir -p $HOME/.config/rofi && ln -sfv $DOTFILES/rofi/config $HOME/.config/rofi/config
mkdir -p $HOME/.config/conky && ln -sfv $DOTFILES/.conkyrc $HOME/.config/conky/conky.conf

ln -sfv $DOTFILES/gitconfig             $HOME/.gitconfig
ln -sfv $DOTFILES/zshrc                 $HOME/.zshrc
ln -sfv $DOTFILES/.vimrc                 $HOME/.vimrc
ln -sfv $DOTFILES/.zshrc                 $HOME/.zshrc
ln -sfv $DOTFILES/pure_dmalt.zsh-theme   $HOME/.oh-my-zsh/themes/pure_dmalt.zsh-theme
ln -sfv $DOTFILES/.tmux.conf             $HOME/.tmux.conf
ln -sfv $DOTFILES/.xinputrc              $HOME/.xinputrc
ln -sfv $DOTFILES/.vimrc                 $HOME/.config/nvim/init.vim
ln -sfv $DOTFILES/.zlogin                $HOME/.zlogin
