#!/bin/bash
linux_packages=(neovim git wget curl tmux ranger bat ripgrep)
python_packages=(neovim flake8 jedi)

distro=`lsb_release -i | sed -r 's/Distributor ID:\t([A-Z][a-z]+)/\1/'` 

if [[ $distro == Arch ]]; then
    installer="pacman -S"
elif [[ $distro == Ubuntu ]]; then
    installer="apt install"
else
    echo "Unknown distro"
    exit 1
fi

for p in ${linux_packages[@]}; do
    /usr/bin/bash -c "sudo $installer $p"
done

for p in ${python_packages[@]}; do
     /usr/bin/bash -c "sudo /usr/bin/pip3 install $p"
done

# ---------- install oh-my-zsh and plugins ----------- #
bash -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# ---------------------------------------------------- #

# Install Vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# make symbolic links
./make_links.sh

# configure i3
# install San Francisco font
 mkdir $HOME/.fonts && wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip && unzip master.zip && rm master.zip && mv YosemiteSanFranciscoFont-master/*.ttf ~/.fonts/ && rm -r YosemiteSanFranciscoFont-master

 wget https://github.com/FortAwesome/Font-Awesome/archive/v4.7.0.zip && unzip v*.zip && rm v*.zip && mv Font-Awesome*/fonts/*.ttf ~/.local/share/fonts/ && rm -r Font-Awesome* 

# wget https://github.com/DaveDavenport/rofi/releases/download/1.2.0/rofi-1.2.0.tar.gz; 
