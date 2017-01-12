#!/bin/bash
# sudo apt-get install ssh
# sudo apt-get install i3blocks
# sudo apt-get install feh
# sudo apt-get install conky

# make symbolic links
bash -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

if ! [[ -d $HOME/.i3 ]]; then
    ln -sv $HOME/dotfiles/.i3/ $HOME/.i3
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


# configure i3
# install San Francisco font
# mkdir $HOME/.fonts; wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip; unzip master.zip; rm master.zip; mv YosemiteSanFranciscoFont-master/*.ttf ~/.fonts/; rm -r YosemiteSanFranciscoFont-master

# wget https://github.com/FortAwesome/Font-Awesome/archive/v4.7.0.zip; unzip v*.zip; rm v*.zip; mv Font-Awesome*/fonts/*.ttf ~/.fonts/; rm -r Font-Awesome* 

#wget https://github.com/DaveDavenport/rofi/releases/download/1.2.0/rofi-1.2.0.tar.gz; 
