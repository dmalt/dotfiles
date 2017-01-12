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
