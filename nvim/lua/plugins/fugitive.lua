return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gw', '<cmd>Gwrite<cr>', { desc = '[G]it [W]rite' })
    vim.keymap.set('n', '<leader>gr', '<cmd>Gread<cr>', { desc = '[G]it [R]ead' })
    vim.keymap.set('n', '<leader>gs', '<cmd>Git<cr>', { desc = '[G]it [S]tatus' })
    vim.keymap.set('n', '<leader>gd', '<cmd>Gdiff<cr>', { desc = '[G]it [D]iff' })
    vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = '[G]it [C]ommit' })
    vim.keymap.set('n', '<leader>ga', '<cmd>Git commit --amend<cr>', { desc = '[G]it commit --[a]mend' })
    vim.keymap.set('n', '<leader>gD', '<cmd>GDelete<cr>', { desc = '[G]it [D]elete' })
  end,
}
