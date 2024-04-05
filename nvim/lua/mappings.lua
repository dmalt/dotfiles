local map = vim.keymap.set

---@diagnostic disable-next-line: undefined-global
vim.g.mapleader = ' '
---@diagnostic disable-next-line: undefined-global
vim.keymap.set('n', ',,', ',')
vim.g.maplocalleader = ','

-- map('i', "C-e", "<esc>l<cmd>lua require('nvim-autopairs.fastwrap').show()<cr>")
-- map('i', "C-e", "<esc><cmd>echo hello<cr>")
-- up and down when the lines are wrapped
-- behave like the regular up and down

-- map({'i', 'n'}, '<c-a>', '<Nop>', {desc = 'Disable numbers increment'})
-- map({'i', 'n'}, '<c-x>', '<Nop>', {desc = 'Disable numbers decrement'})

map('n', 'j', 'gj', { desc = 'move down one line, even for wrapped lines' })
map('n', 'k', 'gk', { desc = 'move up one line, even for wrapped lines' })

map('n', '/', '/\\v')
map('v', '/', '/\\v')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- map('i', '<c-d>', '<del>', {desc = 'delete one char to the right'})
map('n', 'gp', '`[v`]', { desc = 'select last paste' }) -- select last paste
-- map('n', '<cr>', 'a<cr><esc>', {desc = 'break the line'})
map('i', '<c-l>', '<C-G>U<right>', { desc = 'move cursor one char to the right' })
-- map('i', '<c-h>', '<C-G>U<left>', {desc = 'move cursor one char to the right'})
map('n', '<c-s>', ':w<CR>', { desc = 'save current buffer' })
map('i', '<c-s>', '<ESC>:w<CR>a', { desc = 'save current buffer' })

map('n', '<Leader>1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', { desc = 'Navigate to file 1' })
map('n', '<Leader>2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', { desc = 'Navigate to file 2' })
map('n', '<Leader>3', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', { desc = 'Navigate to file 3' })
map('n', '<Leader>4', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', { desc = 'Navigate to file 4' })
map('n', '<c-e>', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', { desc = 'Toggle harpoon menu' })

-- split navigations
-- map({'t', 'i'}, "<M-h>", "<C-\\><C-N><C-w>h", {desc = 'Move one pane to the left'})
-- map({'t', 'i'}, "<M-j>", "<C-\\><C-N><C-w>j", {desc = 'Move one pane down'})
-- map({'t', 'i'}, "<M-k>", "<C-\\><C-N><C-w>k", {desc = 'Move one pane up'})
-- map({'t', 'i'}, "<M-l>", "<C-\\><C-N><C-w>l", {desc = 'Move one pane to the right'})
-- map({'t', 'i'}, "<M-q>", "<C-\\><C-N><C-w>q", {desc = 'Close pane'})
-- map('t', "<C-h>", "<C-\\><C-N><C-w>h", {desc = 'Move one pane to the left'})
-- map('t', "<C-j>", "<C-\\><C-N><C-w>j", {desc = 'Move one pane down'})
-- map('t', "<C-k>", "<C-\\><C-N><C-w>k", {desc = 'Move one pane up'})
-- map('t', "<C-l>", "<C-\\><C-N><C-w>l", {desc = 'Move one pane to the right'})

map({ 't', 'i' }, '<C-q>', '<C-\\><C-N><C-w>q', { desc = 'Close pane' })
map({ 'n', 'v' }, '<C-q>', '<C-w>q', { desc = 'Close pane' })

-- map({'n', 'v'}, "<M-h>", "<C-w>h", {desc = 'Move one pane to the left'})
-- map({'n', 'v'}, "<M-j>", "<C-w>j", {desc = 'Move one pane down'})
-- map({'n', 'v'}, "<M-k>", "<C-w>k", {desc = 'Move one pane up'})
-- map({'n', 'v'}, "<M-l>", "<C-w>l", {desc = 'Move one pane to the right'})
map('n', '<Up>', '<C-W>+', { desc = 'Increase pane size vertically' })
map('n', '<Down>', '<C-W>-', { desc = 'Decrease pane size vertically' })
map('n', '<Right>', '<C-W>>', { desc = 'Increase pane size horizontally' })
map('n', '<Left>', '<C-W><', { desc = 'Decrease pane size horizontally' })
map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit to normal mode' })

map({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete to void buffer' })
map('x', '<leader>p', '"_dP', { desc = 'Paste keeping register' })

map('n', '<LocalLeader><LocalLeader>', '<cmd>ToggleTermSendCurrentLine<cr>')
map('v', '<LocalLeader><LocalLeader>', "<cmd> lua require('utils').visual_send()<cr>")
-- map('v', "<LocalLeader><LocalLeader>", ":ToggleTermSendVisualLinesNoTrims<cr>")

map('n', '<tab>', '<c-^>', { desc = 'edit alt buffer' })

map({ 'n', 'v', 'o' }, '*', '<Plug>(asterisk-z*)', { noremap = false, desc = 'Star-search for word under cursor' })
map({ 'n', 'v', 'o' }, '#', '<Plug>(asterisk-gz*)', { noremap = false })

-- local harpoon = require 'harpoon'

-- -- REQUIRED
-- harpoon:setup()
-- -- REQUIRED

-- vim.keymap.set('n', '<leader>ha', function()
--   harpoon:list():append()
-- end)
-- vim.keymap.set('n', '<leader>hm', function()
--   harpoon.ui:toggle_quick_menu(harpoon:list())
-- end)

-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
vim.keymap.set('i', '<C-c>', '<Esc>')
