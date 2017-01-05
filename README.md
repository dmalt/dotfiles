# Description

My collection of dotfiles. At some point this repo should become a
semiautomatic tool to apply all the custom setups on a completely new machine

# My tools

| Task            | Tool     | Dotfile           |
|-----------------|----------|-------------------|
| Windows manager | i3       | .i3/config        |
| Status bar      | i3blocks | .i3/i3blocks.conf |
| Text editor     | neovim   | .vimrc            |
| Shell           | zsh      | .zshrc            |
| Version control | git      | .gitconfig        |
| System monitor  | conky    | .conkyrc          |

# Manual tweaks

### ZSHELL
I use oh-my-zsh for zshell customization. I really like pure theme
but I wanted to add timestamp to the right of the screen so I modified it a bit and
put my version in this repo. To make it available create a symlink inside .oh-my-zsh/themes folder like this:

```bash
ln -s ~/dotfiles/pure_dmalt.zsh-theme ~/.oh-my-zsh/themes/pure_dmalt.zsh-theme
```

After that you can activate it adding 

```bash
ZSH_THEME="pure_dmalt"
```

to your .zshrc file
