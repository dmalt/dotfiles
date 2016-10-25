#!/bin/bash
sudo apt-get install git
sudo apt-get install ssh
# make symbolic links
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/.i3 ~/.i3
ln -s ~/dotfiles/.zshrc ~/.zshrc

