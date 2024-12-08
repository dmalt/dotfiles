return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    -- require('harpoon').setup { menu = { width = vim.api.nvim_win_get_width(0) - 4 } }
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set({ 'n', 't' }, '<C-,>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    vim.keymap.set('n', '<LocalLeader>m', function()
      harpoon:list():append()
    end)
    vim.keymap.set('n', '<LocalLeader>a', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<LocalLeader>s', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<LocalLeader>d', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<LocalLeader>f', function()
      harpoon:list():select(4)
    end)
  end,
}
