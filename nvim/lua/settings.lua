local set = vim.opt  ---@diagnostic disable-line: undefined-global
local g = vim.g  ---@diagnostic disable-line: undefined-global
Line_length = 99

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true

set.scrolloff = 5
set.showmode = false
set.hidden = true
set.ruler = false
set.smartcase = true
set.clipboard = "unnamed,unnamedplus"
set.splitbelow = true
set.splitright = true
set.termguicolors = true
set.diffopt = vim.opt.diffopt + "vertical"  ---@diagnostic disable-line

set.number = true
set.relativenumber = true
set.cursorline = true
set.list = true  -- enable explicit chars for endlines and such
set.listchars = {eol = '󰌑', tab = '>-'}
set.foldmethod = "marker"

set.expandtab = true
set.undofile = true
set.autoindent = true

-- set.colorcolumn = "100"
set.colorcolumn = { tostring(Line_length), }
set.timeoutlen=500
set.updatetime=300  -- to trigger `vim.diagnostic.open_float` in autocmd in a reasonable time

g.python_host_prog='/usr/bin/python2'
g.python3_host_prog='/usr/bin/python'
