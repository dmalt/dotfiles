#!/bin/bash
sudo apt-get install ssh
sudo apt-get install i3blocks
sudo apt-get install feh
# make symbolic links
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.i3/ ~/.i3
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc

# configure i3
# install San Francisco font
mkdir ~/.fonts; wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip; unzip master.zip; rm master.zip; mv YosemiteSanFranciscoFont-master/*.ttf ~/.fonts/; rm -r YosemiteSanFranciscoFont-master

wget https://github.com/FortAwesome/Font-Awesome/archive/v4.7.0.zip; unzip v*.zip; rm v*.zip; mv Font-Awesome*/fonts/*.ttf ~/.fonts/; rm -r Font-Awesome* 

