local map = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- up and down when the lines are wrapped
-- behave like the regular up and down
map('n', 'j', 'gj', {desc = 'move down one line, even for wrapped lines'})
map('n', 'k', 'gk', {desc = 'move up one line, even for wrapped lines'})

map('n', '/', '/\\v')
map('v', '/', '/\\v')


map('i', '<c-d>', '<del>', {desc = 'delete one char to the right'})
map('n', 'gp', '`[v`]', {desc = 'select last paste'})  -- select last paste
map('n', '<cr>', 'a<cr><esc>', {desc = 'break the line'})
map('i', '<C-l>', '<C-G>U<right>', {desc = 'move cursor one char to the right'})

map('n', '<c-s>', ':w<CR>', {desc = 'save current buffer'})
map('i', '<c-s>', '<ESC>:w<CR>a', {desc = 'save current buffer'})


-- split navigations
map('t', "<M-h>", "<C-\\><C-N><C-w>h", {desc = 'Move one pane to the left'})
map('t', "<M-j>", "<C-\\><C-N><C-w>j", {desc = 'Move one pane down'})
map('t', "<M-k>", "<C-\\><C-N><C-w>k", {desc = 'Move one pane up'})
map('t', "<M-l>", "<C-\\><C-N><C-w>l", {desc = 'Move one pane to the right'})
map('t', "<M-q>", "<C-\\><C-N><C-w>q", {desc = 'Close pane'})
map('i', "<M-h>", "<C-\\><C-N><C-w>h", {desc = 'Move one pane to the left'})
map('i', "<M-j>", "<C-\\><C-N><C-w>j", {desc = 'Move one pane down'})
map('i', "<M-k>", "<C-\\><C-N><C-w>k", {desc = 'Move one pane up'})
map('i', "<M-l>", "<C-\\><C-N><C-w>l", {desc = 'Move one pane to the right'})
map('i', "<M-q>", "<C-\\><C-N><C-w>q", {desc = 'Close pane'})
map('n', "<M-h>", "<C-w>h", {desc = 'Move one pane to the left'})
map('n', "<M-j>", "<C-w>j", {desc = 'Move one pane down'})
map('n', "<M-k>", "<C-w>k", {desc = 'Move one pane up'})
map('n', "<M-l>", "<C-w>l", {desc = 'Move one pane to the right'})
map('n', "<M-q>", "<C-w>q", {desc = 'Close pane'})
map('n', "<Up>",  "<C-W>+", {desc = 'Increase pane size vertically'})
map('n', "<Down>",  "<C-W>-", {desc = 'Decrease pane size vertically'})
map('n', "<Right>",  "<C-W>>", {desc = 'Increase pane size horizontally'})
map('n', "<Left>",  "<C-W><", {desc = 'Decrease pane size horizontally'})
map('t', "<Esc>",  "<C-\\><C-n>", {desc = 'Exit to normal mode'})

local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    f = {
      name = "+find",
      f = { "<cmd>Telescope find_files<cr>", "Files" },
      h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
      l = { "<cmd>Telescope live_grep<cr>", "Lines" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    },
    p = {
      name = "+packer",
      u = { "<cmd>PackerUpdate<cr>", "Update packages"},
      i = { "<cmd>PackerInstall<cr>", "Install packages"},
      s = { "<cmd>PackerSync<cr>", "Sync packages"},
      c = { "<cmd>PackerClean<cr>", "Clean packages"},
    },
    e = {
      name = "+edit",
      i = { "<cmd>edit $MYVIMRC<cr>", "Edit init.vim"},
      p = { "<cmd>edit $HOME/.dotfiles/nvim/lua/plugins.lua<cr>", "Edit plugins"},
      m = { "<cmd>edit $HOME/.dotfiles/nvim/lua/mappings.lua<cr>", "Edit mappings"},
      s = { "<cmd>edit $HOME/.dotfiles/nvim/lua/settings.lua<cr>", "Edit settings"},
    },
  },
})
