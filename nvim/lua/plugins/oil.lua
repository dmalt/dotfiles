return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      columns = { 'icon' },
      keymaps = {
        ['<C-h>'] = false,
        ['<C-l>'] = false,
        ['<C-s>'] = false,
        ['<leader>:'] = {
          'actions.open_cmdline',
          opts = {
            shorten_path = true,
            modify = ':h',
          },
          desc = 'Open the command line with the current directory as an argument',
        },
        ['<leader>t'] = {
          'actions.open_terminal',
          desc = 'Open the terminal with the current directory as an argument',
        },
      },
    }
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}
