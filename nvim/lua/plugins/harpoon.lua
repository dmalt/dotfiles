return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    -- require('harpoon').setup { menu = { width = vim.api.nvim_win_get_width(0) - 4 } }
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set('n', '<C-,>', function()
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
    vim.keymap.set('n', '<LocalLeader>;', function()
      harpoon:list():select(4)
    end)
  end,
}
-- {
--   'ThePrimeagen/harpoon',
--   branch = 'harpoon2',
--   dependencies = { 'nvim-lua/plenary.nvim' },
--   config = function()
--     local harpoon = require 'harpoon'

--     -- REQUIRED
--     harpoon:setup { menu = { width = vim.api.nvim_win_get_width(0) - 4 } }
--     -- REQUIRED

--     vim.keymap.set('n', '<LocalLeader>a', function()
--       harpoon:list():append()
--     end)
--     vim.keymap.set('n', '<C-,>', function()
--       harpoon.ui:toggle_quick_menu(harpoon:list())
--     end)

--     vim.keymap.set('n', '<LocalLeader>h', function()
--       harpoon:list():select(1)
--     end)
--     vim.keymap.set('n', '<LocalLeader>t', function()
--       harpoon:list():select(2)
--     end)
--     vim.keymap.set('n', '<LocalLeader>n', function()
--       harpoon:list():select(3)
--     end)
--     vim.keymap.set('n', '<LocalLeader>s', function()
--       harpoon:list():select(4)
--     end)

--     -- Toggle previous & next buffers stored within Harpoon list
--     vim.keymap.set('n', '<C-S-P>', function()
--       harpoon:list():prev()
--     end)
--     vim.keymap.set('n', '<C-S-N>', function()
--       harpoon:list():next()
--     end)
--   end,
-- },
