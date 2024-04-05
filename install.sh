#!/bin/bash

# include git in case it's not already installed, i.e. dotfiles were downloaded as zip
linux_packages=(neovim git wget curl tmux ranger python3-pip htop zsh)
python_packages=(pynvim neovim flake8 jedi black)

# ---------- get distribution plugin manager -------- #
distro=$(lsb_release -i | sed -r 's/Distributor ID:\t([A-Z][a-z]+)/\1/')

if [[ $distro == Arch ]]; then
    installer="pacman -S"
elif [[ $distro == Ubuntu ]]; then
    installer="apt install"
else
    echo "Unknown distro"
    exit 1
fi


# install packages
for p in "${linux_packages[@]}"; do
    /usr/bin/bash -c "sudo $installer $p"
done

for p in "${python_packages[@]}"; do
     /usr/bin/bash -c "sudo /usr/bin/pip3 install $p"
done

./install_oh_my_zsh.sh


# make symbolic links
# ./make_links.sh

# install fzf
if [ ! -d "$HOME/.fzf" ]
then
    git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
    "$HOME/.fzf/install"
fi
