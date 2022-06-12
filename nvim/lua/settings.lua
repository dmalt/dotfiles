local set = vim.opt

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = True

set.scrolloff = 5
set.showmode = false
set.hidden = true
set.ruler = false
set.smartcase = true
set.clipboard = "unnamed,unnamedplus"
set.splitbelow = true
set.splitright = true
set.termguicolors = true
set.diffopt = vim.opt.diffopt + "vertical"

set.number = true
set.relativenumber = true
set.cursorline = true
set.list = true  -- enable explicit chars for endlines and such
set.listchars = {eol = '¶', tab = '>-'}
set.foldmethod = "marker"

set.expandtab = true
set.undofile = true
set.autoindent = true

vim.g.python_host_prog='/usr/bin/python2'
vim.g.python3_host_prog='/usr/bin/python'
