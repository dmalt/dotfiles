# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository containing configuration files for a development environment centered around Neovim, Zsh, Tmux, and various system utilities. The configuration is designed for macOS but originally supported Linux distributions (Ubuntu/Arch).

## Installation and Setup Commands

### Initial Setup
```bash
# Clone and install dotfiles
git clone git@github.com:dmalt/dotfiles.git .dotfiles
cd .dotfiles
./install.sh
```

### Change Default Shell
```bash
chsh -s $(which zsh)
# Then logout and log back in
```

### Create Symbolic Links
```bash
./make_links.sh
```

## Architecture and Key Components

### Configuration Structure

**Core Shell Environment:**
- `zshrc` - Main Zsh configuration with oh-my-zsh integration
- `aliases.sh` - Custom command aliases and shortcuts  
- `functions.sh` - Custom shell functions
- `pure_dmalt.zsh-theme` - Custom Zsh theme

**Neovim Configuration (nvim/):**
- `init.lua` - Main entry point that loads settings, mappings, and plugins
- `lua/settings.lua` - Core Neovim settings and options
- `lua/mappings.lua` - Key bindings and shortcuts
- `lua/config/lazy.lua` - Lazy.nvim plugin manager configuration
- `lua/plugins/` - Individual plugin configurations organized by functionality
- `after/ftplugin/` - Language-specific settings (TypeScript, Python, Lua, etc.)

**System Configuration:**
- `gitconfig` - Git configuration
- `tmux.conf` - Terminal multiplexer settings

### Plugin Management

The Neovim configuration uses Lazy.nvim as the plugin manager. Key plugin categories include:
- **LSP & Completion:** LSP configuration, auto-completion (both nvim-cmp and blink-cmp setups)
- **File Navigation:** Telescope (fuzzy finder), Oil (file manager), Harpoon
- **Git Integration:** Fugitive, Gitsigns
- **Code Quality:** Conform (formatting), nvim-lint (linting)
- **UI/UX:** Colorscheme management, which-key, treesitter

### Language Support

The configuration includes specific setups for:
- **TypeScript/JavaScript:** Custom ftplugin configurations
- **Python:** Python-specific settings and tools
- **Lua:** Neovim Lua development support
- **Markdown:** Obsidian integration for note-taking

### Development Workflow Features

**Version Control Integration:**
- Git shortcuts: `gt` (go to git root), various git aliases
- AWS EC2 management aliases for development instances
- Docker and poetry plugin support in Zsh

**Navigation Shortcuts:**
- `ra` for Ranger file manager
- `vi`/`vim` aliased to `nvim`
- Custom directory creation with `mcd`
- File system utilities with safety reminders (ncdu, fd, tldr)

### Environment Variables

Key environment variables set:
- `EDITOR=nvim` - Default text editor
- `DOTFILES=$HOME/.dotfiles` - Dotfiles location
- Python host programs configured for Neovim
- PATH modifications for Homebrew, local bins, and development tools

## Important Notes

- The configuration supports both local overrides (`$DOTFILES_LOCAL/zshrc_local`)
- Neovim uses Python 3 from Homebrew (`/opt/homebrew/bin/python3`)
- FZF integration for command history and file searching
- AWS CLI integration with development profiles
- The setup includes safety aliases that remind users of better alternatives (e.g., `du` → `ncdu`, `man` → `tldr`)