#!/bin/bash

# include git in case it's not already installed, i.e. dotfiles were downloaded as zip
linux_packages=(neovim git wget curl tmux ranger python3-pip htop zsh)
python_packages=(neovim flake8 jedi black)

# ---------- get distribution plugin manager -------- #
distro=`lsb_release -i | sed -r 's/Distributor ID:\t([A-Z][a-z]+)/\1/'`

if [[ $distro == Arch ]]; then
    installer="pacman -S"
elif [[ $distro == Ubuntu ]]; then
    installer="apt install"
else
    echo "Unknown distro"
    exit 1
fi


# install packages
for p in ${linux_packages[@]}; do
    /usr/bin/bash -c "sudo $installer $p"
done

for p in ${python_packages[@]}; do
     /usr/bin/bash -c "sudo /usr/bin/pip3 install $p"
done

# ---------- install oh-my-zsh and plugins ----------- #
bash -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]
then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
# ---------------------------------------------------- #

# Install Vundle for vim
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

# make symbolic links
./make_links.sh

# install fzf
if [ ! -d $HOME/.fzf ]
then
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    $HOME/.fzf/install
fi
