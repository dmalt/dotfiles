export DOTFILES=$HOME/.dotfiles


ln -sfv $DOTFILES/gitconfig             $HOME/.gitconfig
ln -sfv $DOTFILES/zshrc                 $HOME/.zshrc
ln -sfv $DOTFILES/pure_dmalt.zsh-theme  $HOME/.oh-my-zsh/themes/pure_dmalt.zsh-theme
ln -sfv $DOTFILES/tmux.conf             $HOME/.tmux.conf
ln -sfv $DOTFILES/xinputrc              $HOME/.xinputrc
ln -sfv $DOTFILES/nvim/init.vim         $HOME/.vimrc
ln -sfv $DOTFILES/zlogin                $HOME/.zlogin

if [ -L "$HOME/.config/nvim" ] || [ -d "$HOME/.config/nvim" ]
then
    rm -r $HOME/.config/nvim
fi
ln -sfv $DOTFILES/nvim $HOME/.config/nvim


if [ -L "$HOME/.config/ranger" ] || [ -d "$HOME/.config/ranger" ]
then
    rm -r $HOME/.config/ranger
fi
ln -sfv "$DOTFILES/ranger"              $HOME/.config/ranger
