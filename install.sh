#!/bin/bash
# sudo apt-get install ssh
# sudo apt-get install i3blocks
# sudo apt-get install feh
# sudo apt-get install conky

# make symbolic links
if ! [[ -d ~/.i3 ]]; then
    ln -sv ~/dotfiles/.i3/ ~/.i3
fi

ln -sfv ~/dotfiles/.gitconfig ~/.gitconfig
ln -sfv ~/dotfiles/.zshrc ~/.zshrc
ln -sfv ~/dotfiles/.vimrc ~/.vimrc
ln -sfv ~/dotfiles/.conkyrc ~/.conkyrc
ln -sfv ~/dotfiles/.zshrc ~/.zshrc
ln -sfv ~/dotfiles/pure_dmalt.zsh-theme ~/.oh-my-zsh/themes/pure_dmalt.zsh-theme
ln -sfv ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sfv $HOME/dotfiles/.xinputrc $HOME/.xinputrc
ln -sfv $HOME/.nvimrc $HOME/.vimrc


bash -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# configure i3
# install San Francisco font
# mkdir ~/.fonts; wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip; unzip master.zip; rm master.zip; mv YosemiteSanFranciscoFont-master/*.ttf ~/.fonts/; rm -r YosemiteSanFranciscoFont-master

# wget https://github.com/FortAwesome/Font-Awesome/archive/v4.7.0.zip; unzip v*.zip; rm v*.zip; mv Font-Awesome*/fonts/*.ttf ~/.fonts/; rm -r Font-Awesome* 

#wget https://github.com/DaveDavenport/rofi/releases/download/1.2.0/rofi-1.2.0.tar.gz; 
