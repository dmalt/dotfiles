# Description

My collection of dotfiles. At some point this repo should become a
semiautomatic tool to apply all the custom setups on a completely new machine

# My tools

| Category        | Tool     | Dotfile           |
|-----------------|----------|-------------------|
| Windows manager | i3       | .i3/config        |
| Status bar      | i3blocks | .i3/i3blocks.conf |
| Text editor     | neovim   | .vimrc            |
| Shell           | zsh      | .zshrc            |
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
``` 
sudo apt-get install python-pip
```

then install the fonts themselves
Documentation can be found here:

https://powerline.readthedocs.io/en/master/installation.html#patched-fonts

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
