local set = vim.opt
local g = vim.g
Line_length = 88
set.colorcolumn = { tostring(Line_length + 1) }

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4

set.mouse = 'a'
-- Minimal number of screen lines to keep above and below the cursor.
set.scrolloff = 10
set.showmode = false
set.hidden = true
set.ruler = false
set.smartcase = true

vim.g.have_nerd_font = true
vim.schedule(function()
  set.clipboard = 'unnamed,unnamedplus'
end)

set.splitbelow = true
set.splitright = true
set.termguicolors = true
set.diffopt = vim.opt.diffopt + 'vertical'

set.number = true -- ks
set.relativenumber = true -- ks

-- Show which line your cursor is on
set.cursorline = true

set.list = true -- enable explicit chars for endlines and such
set.listchars = { eol = '󰌑', tab = '» ', trail = '·', nbsp = '␣' }

set.foldmethod = 'marker'

-- Preview substitutions live, as you type!
set.inccommand = 'split'

set.expandtab = true
set.undofile = true
-- set.autoindent = true

-- set.colorcolumn = "100"
set.timeoutlen = 300
set.updatetime = 250 -- to trigger `vim.diagnostic.open_float` in autocmd in a reasonable time
g.python_host_prog = '/opt/homebrew/bin/python3'
g.python3_host_prog = '/opt/homebrew/bin/python3'
g.snippets = 'luasnip'
