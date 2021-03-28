export DOTFILES=$HOME/.dotfiles
if ! [[ -d $HOME/.config/i3 ]]; then
    ln -sv $DOTFILES/i3 $HOME/.config/i3
fi

mkdir -p $HOME/.config/rofi && ln -sfv $DOTFILES/rofi/config $HOME/.config/rofi/config
mkdir -p $HOME/.config/conky && ln -sfv $DOTFILES/conkyrc $HOME/.config/conky/conky.conf
mkdir -p $HOME/.config/termite && ln -sfv $DOTFILES/termiterc $HOME/.config/termite/config

ln -sfv $DOTFILES/gitconfig             $HOME/.gitconfig
ln -sfv $DOTFILES/zshrc                 $HOME/.zshrc
ln -sfv $DOTFILES/pure_dmalt.zsh-theme  $HOME/.oh-my-zsh/themes/pure_dmalt.zsh-theme
ln -sfv $DOTFILES/tmux.conf             $HOME/.tmux.conf
ln -sfv $DOTFILES/xinputrc              $HOME/.xinputrc
ln -sfv $DOTFILES/nvim/init.vim         $HOME/.vimrc
ln -sfv $DOTFILES/zlogin                $HOME/.zlogin

if [[ -d $HOME/.config/nvim ]]; then
    rm -r $HOME/.config/nvim/
fi
ln -sfv $DOTFILES/nvim $HOME/.config/nvim

if [[ -d $HOME/.config/ranger ]]; then
    rm -r $HOME/.config/ranger
fi
ln -sfv $DOTFILES/ranger                $HOME/.config/ranger
