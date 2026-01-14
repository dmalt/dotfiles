vim.g.mapleader = ' '
vim.keymap.set('n', ',,', ',')
vim.g.maplocalleader = ','

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', 'j', 'gj', { desc = 'move down one line, even for wrapped lines' })
vim.keymap.set('n', 'k', 'gk', { desc = 'move up one line, even for wrapped lines' })

-- set 'very magic' option when searching
-- vim.keymap.set('n', '/', '/\\v')
-- vim.keymap.set('n', '?', '?\\v')
-- vim.keymap.set('v', '/', '/\\v')
-- vim.keymap.set('v', '?', '?\\v')

vim.keymap.set('n', 'gp', '`[v`]', { desc = 'select last paste' })

vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete to void buffer' })
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste keeping register' })

-- Diagnostic keymaps
vim.diagnostic.config { float = { source = true } }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>cq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('i', 'jk', 'Esc', { desc = 'Exit to normal mode' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit to normal mode' })
-- vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Exit to normal mode' })

-- Terminal mode split navigation
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Move to left window from terminal' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Move to lower window from terminal' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Move to upper window from terminal' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Move to right window from terminal' })
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Exit to normal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- vim.keymap.set('i', '<C-l>', '<C-G>U<right>', { desc = 'move cursor one char to the right' })
-- vim.keymap.set('n', '<tab>', '<c-^>', { desc = 'edit alt buffer' })

vim.keymap.set('n', '<Up>', '<C-W>+', { desc = 'Increase pane size vertically' })
vim.keymap.set('n', '<Down>', '<C-W>-', { desc = 'Decrease pane size vertically' })
vim.keymap.set('n', '<Right>', '<C-W>>', { desc = 'Increase pane size horizontally' })
vim.keymap.set('n', '<Left>', '<C-W><', { desc = 'Decrease pane size horizontally' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Enter insert mode for terminal right away',
  group = vim.api.nvim_create_augroup('term-open', { clear = true }),
  -- command = 'startinsert',
  callback = function()
    -- vim.opt.number = false
    -- vim.opt.relativenumber = false
    vim.cmd 'startinsert'
  end,
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
  vim.fn.system 'ssh ec2 -t "cd code/monorepo && git pull"'
end

vim.keymap.set('n', '<Leader>ru', sync_fn, { desc = '[R]emote [U]pdate' })

vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<cr>')
vim.keymap.set('n', '<leader>x', ':.lua<cr>')

-- vim.keymap.set('i', '<ESC><ESC>', '<ESC>:w<CR>', { desc = 'Exit to Normal mode and save' })
--
-- vim.keymap.set('n', '<leader>rr', "*:%s//<C-R>//g", { desc = '[R]eplace' })
-- vim.keymap.set('n', '<leader>rr', "*:%s//<C-R>=substitute(@/, '\\\\<\\\\>', '', 'g')<CR>/g", { desc = '[R]eplace' })
vim.keymap.set('n', '<leader>rr', function()
  local word = vim.fn.expand '<cword>'
  vim.fn.feedkeys([[:%s/\<]] .. word .. [[\>/]] .. word, 'n')
end, { desc = '[R]eplace' })

vim.keymap.set('n', '<leader>rv', 'O<C-R>. = <C-R>"<ESC>==', { desc = '[R]efactor [V]ariable' })
vim.keymap.set('v', '<leader>rv', 'O<C-R>. = <C-R>"<ESC>==', { desc = '[R]efactor [V]ariable' })

vim.keymap.set('n', '<leader>yd', ":let @+ = expand('%:p:h')<CR>", { desc = '[Y]ank [D]ir' })
vim.keymap.set('n', '<leader>yp', ":let @+ = expand('%:p')<CR>", { desc = '[Y]ank [P]ath' })
vim.keymap.set('n', '<leader>yn', ":let @+ = expand('%:t')<CR>", { desc = '[Y]ank [N]ame' })

local function close_buffer_keep_window()
  local buf = vim.api.nvim_get_current_buf()
  local wins = vim.fn.win_findbuf(buf)

  -- If buffer is shown in multiple windows, just switch this window
  if #wins > 1 then
    if vim.fn.buflisted(vim.fn.bufnr '#') == 1 then
      vim.cmd 'buffer #'
    else
      vim.cmd 'enew'
    end
  else
    -- Buffer only in current window, safe to delete
    if vim.fn.buflisted(vim.fn.bufnr '#') == 1 then
      vim.cmd 'buffer #'
    else
      vim.cmd 'enew'
    end
    vim.api.nvim_buf_delete(buf, { force = true })
  end
end

vim.keymap.set('n', '<leader>kb', close_buffer_keep_window, { desc = '[K]ill [b]uffer, keep window' })

-- Terminal in current buffer's directory
vim.keymap.set('n', '<leader>tt', function()
  local current_dir = vim.fn.expand '%:p:h'
  vim.cmd('term cd ' .. vim.fn.shellescape(current_dir) .. ' && $SHELL')
end, { desc = '[T]erminal in folder' })
