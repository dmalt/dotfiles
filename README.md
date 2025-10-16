# Dotfiles

Personal development environment configuration for macOS, centered around Neovim and Zsh.

## Installation

### Quick Setup

Clone dotfiles and run installation:

```bash
git clone git@github.com:dmalt/dotfiles.git .dotfiles
cd .dotfiles
./install.sh
```

### Change Default Shell

```bash
chsh -s $(which zsh)
# Logout and log back in
```

### Create Symbolic Links

```bash
./make_links.sh
```

## Features

### Neovim Configuration

- **Plugin Manager:** Lazy.nvim
- **LSP & Completion:** Full language server support with blink-cmp/nvim-cmp
- **File Navigation:** Telescope fuzzy finder, Oil file manager, Harpoon
- **Git Integration:** Fugitive, Gitsigns
- **Code Quality:** Conform formatting, nvim-lint
- **Language Support:** TypeScript, Python, Lua, Markdown

### Zsh Environment

- **Framework:** oh-my-zsh with custom theme
- **Features:** FZF integration, Git shortcuts, AWS EC2 aliases
- **Safety:** Better alternatives for common commands (ncdu, fd, tldr)

### Development Workflow

- Git shortcuts: `gt` (go to git root)
- File manager: `ra` (Ranger)
- Directory creation: `mcd`
- Docker and Poetry plugin support
