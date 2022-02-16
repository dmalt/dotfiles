# Description

My collection of dotfiles.

# My tools

| Category          | Tool      | Dotfile           |
|-------------------|-----------|-------------------|
| Windows manager   | i3        | i3/config         |
| Status bar        | i3blocks  | i3/i3blocks.conf  |
| Text editor       | neovim    | nvim/init.vim     |
| Shell             | zsh       | zshrc, zlogin     |
| Version control   | git       | gitconfig         |
| System monitor    | conky     | conkyrc           |
| Terminal emulator | alacritty |                   |

# Installation

Clone dotfiles to the home folder and run the installation script:
```bash
git clone git@github.com:dmalt/dotfiles.git .dotfiles
cd dotfiles
./install.sh
```

### Installed components
- Python packages: neovim flake8 jedi black
- System packages: neovim wget curl tmux ranger bat fzf htop
- oh-my-zsh, zsh-syntax-highlighting
- Vundle (vim plugin manager)

Additionally the script makes symbolic links to destination dotfiles

### Change default terminal to zsh
`chsh -s $(which zsh)`

Then logout and log back in

## Alacritty

For Ubuntu just add repo and install:

```
sudo add-apt-repository ppa:aslatter/ppa
sudo apt install alacritty
```

### Vim / Neovim plugins

Open vim/neovim and type

```
:PluginInstall
```


### Rofi

Ubuntu:
```
sudo apt-get install rofi
```

In i3/config find rofi-launching command and  adjust padding and fontsize

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

1. Mount the first image with
    ```bash
    mkdir ~/mountpoint
    sudo mount image1.iso ~/mountpoint
    ```

2. Run the installation script with

    ```bash
    sudo ~/mountpoint/install
    ```

3. When the installation from the first image is done, the popup window is shown.
Unmount the first image and mount the second one to the same mounting point:

    ```bash
    sudo umount ~/mountpoint
    sudo mount image2.iso ~/mountpoint
    ```

4. Click ok in the popup window to continue the installation.

5. Copy files

6. The first time run MATLAB with sudo to activate it.
Sudo is required since the default installation locacation is `/usr/local`
and regular user doesn't have has permissions to write there.

```bash
sudo `which matlab`
```

#### After installation
1.Matlab complains about fontconfig.
```bash
	cd /usr/local/MATLAB/<version>/bin/glnxa64
	sudo mv libfreetype.so.6.11.1{,.bak}
```

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

Powerline font for vim-airline plugin
=====================================
Follow installation [instructions](https://github.com/powerline/fonts)


i3 setup
========
Don't forget to install i3blocks package:
```
sudo apt-get install i3blocks
```
