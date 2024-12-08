vim.g.mapleader = ' '

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', 'j', 'gj', { desc = 'move down one line, even for wrapped lines' })
vim.keymap.set('n', 'k', 'gk', { desc = 'move up one line, even for wrapped lines' })

-- set 'very magic' option when searching
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('n', '?', '?\\v')
vim.keymap.set('v', '/', '/\\v')
vim.keymap.set('v', '?', '?\\v')

vim.keymap.set('n', 'gp', '`[v`]', { desc = 'select last paste' })

vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete to void buffer' })
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste keeping register' })

-- Diagnostic keymaps
vim.diagnostic.config { float = { source = true } }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>cq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit to normal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('i', '<C-l>', '<C-G>U<right>', { desc = 'move cursor one char to the right' })
vim.keymap.set('n', '<tab>', '<c-^>', { desc = 'edit alt buffer' })

vim.keymap.set('n', '<Up>', '<C-W>+', { desc = 'Increase pane size vertically' })
vim.keymap.set('n', '<Down>', '<C-W>-', { desc = 'Decrease pane size vertically' })
vim.keymap.set('n', '<Right>', '<C-W>>', { desc = 'Increase pane size horizontally' })
vim.keymap.set('n', '<Left>', '<C-W><', { desc = 'Decrease pane size horizontally' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Enter insert mode for terminal right away',
  group = vim.api.nvim_create_augroup('term-open', { clear = true }),
  command = 'startinsert',
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
local sync_fn = function()
  vim.cmd 'Git push'
  vim.cmd "TermExec cmd='git pull'"
end

vim.keymap.set('n', '<Leader>ru', sync_fn, { desc = '[R]emote [U]pdate' })
