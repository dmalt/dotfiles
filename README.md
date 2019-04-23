# Description

My collection of dotfiles.

# My tools

| Category        | Tool     | Dotfile           |
|-----------------|----------|-------------------|
| Windows manager | i3       | .i3/config        |
| Status bar      | i3blocks | .i3/i3blocks.conf |
| Text editor     | neovim   | .vimrc            |
| Shell           | zsh      | .zshrc, .zlogin   |
| Version control | git      | .gitconfig        |
| System monitor  | conky    | .conkyrc          |

# Installation

```bash
git clone git@github.com:dmalt/dotfiles.git
cd dotfiles
./install.sh
```

# Manual steps

### Vim / Neovim

Open vim/neovim and type 

```
:PluginInstall
```

## Ubuntu installation steps

### Rofi
install rofi by
```
sudo apt-get install rofi
```

In .i3/config find rofi-launching command and  adjust padding and fontsize

### vim-airline fonts

first install pip:
> ``` 
> sudo apt-get install python-pip
> ```

> then install the fonts themselves

git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

> documentation can be found here:

> https://powerline.readthedocs.io/en/master/installation.html#patched-fonts

then reboot for changes to take effect

### Conky
install lm-sensors with
```
sudo apt-get install lm-sensors
```
Also install fortune

```
sudo apt-get install fortune
```

Setup horizontal and vertical padding in .conkyrc



### Add ssh key to github

#### Generating ssh key
First, make sure ```openssh``` package is installed

> In arch use:
> ```bash
> sudo pacman -S openssh
> ```

Run the following to generate the key:

```bash
ssh-keygen -t rsa -b 4096 -C "dm.altukhov@ya.ru"
```

Then add key to ssh-agent:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

#### Adding ssh key to github account

Copy key to clipboard:
```bash
xclip -sel clip < ~/.ssh/id_rsa.pub
```

Go to github ---> settings ---> SSH and GPG keys ---> new

Matlab installation
===================

> To mount .iso images in arch use ```fuseiso```:
> ```bash
> mkdir ~/mountpoint
> sudo fuseiso  image.iso ~/mountpoint
> ```

If there are two installation .iso images  mount the first image
and then when prompted unmount the first image and mount the second to
the same mounting point.


Z-shell and plugins
===================

1) Install z-shell
2) Install oh-my-zsh
3) Install 3-d party plugins

List of 3-d party plugins:

* zsh-autosuggestions

Borg
====

Borg should be installed with /usr/bin/pip (not anaconda version);
msgpack version should be 0.5.6

```
/usr/bin/pip3 install msgpack==0.5.6
/usr/bin/pip3 install borgbackup[fuse]
```



