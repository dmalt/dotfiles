local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- return require('packer').startup(function(use)
require('lazy').setup {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'tpope/vim-unimpaired',
  'tpope/vim-repeat',
  'tpope/vim-fugitive',
  -- 'michaeljsmith/vim-indent-object',
  -- 'tommcdo/vim-exchange',
  require 'plugins.telescope',
  {
    'haya14busa/vim-asterisk',
    config = function()
      vim.g['asterisk#keeppos'] = 1
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    config = function()
      require('config.lsp').setup()
      require('config.cmp').setup()
    end,
    -- wants = { "LuaSnip" },
    dependencies = {
      'hrsh7th/nvim-cmp',
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim', -- Optional
      'williamboman/mason-lspconfig.nvim', -- Optional
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'ray-x/cmp-treesitter',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'saadparwaiz1/cmp_luasnip',
      'folke/neodev.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      {
        'j-hui/fidget.nvim',
        config = function()
          require('fidget').setup {}
        end,
      },
    },
    disable = false,
  },
  --
  -- require 'plugins.lspconfig',
  require 'plugins.conform',
  require 'plugins.nvim_cmp',
  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {}
      require('which-key').register {
        ['<leader>'] = {
          s = { name = '[S]earch', _ = 'which_key_ignore' },
          e = {
            name = '+edit',
            i = { '<cmd>edit $MYVIMRC<cr>', 'Edit init.lua' },
            p = { '<cmd>edit $HOME/.dotfiles/nvim/lua/plugins.lua<cr>', 'Edit plugins' },
            m = { '<cmd>edit $HOME/.dotfiles/nvim/lua/mappings.lua<cr>', 'Edit mappings' },
            s = { '<cmd>edit $HOME/.dotfiles/nvim/lua/settings.lua<cr>', 'Edit settings' },
            t = {
              '<cmd>edit $HOME/.dotfiles/nvim/lua/plugins_config/treesitter_config.lua<cr>',
              'Edit treesitter settings',
            },
            l = { '<cmd>edit $HOME/.dotfiles/nvim/after/plugin/luasnip.lua<cr>', 'Edit Lua snippets' },
          },
          -- s = {
          --   name = '+edit',
          --   i = { '<cmd>source $MYVIMRC<cr>', 'Source init.lua' },
          --   p = { '<cmd>source $HOME/.dotfiles/nvim/lua/plugins.lua<cr>', 'Source plugins' },
          --   m = { '<cmd>source $HOME/.dotfiles/nvim/lua/mappings.lua<cr>', 'Source mappings' },
          --   s = { '<cmd>source $HOME/.dotfiles/nvim/lua/settings.lua<cr>', 'Source settings' },
          --   t = {
          --     '<cmd>source $HOME/.dotfiles/nvim/lua/plugins_config/treesitter_config.lua<cr>',
          --     'Source treesitter settings',
          --   },
          --   l = {
          --     '<cmd>source $HOME/.dotfiles/nvim/after/plugin/luasnip.lua<cr>',
          --     'Source Lua snippets',
          --   },
          -- },
          n = {
            name = '[N]vim-tree',
            f = { '<cmd>NvimTreeFindFile<cr>', 'Find current file in tree' },
          },
          t = {
            name = '+terminal',
            f = { '<cmd>ToggleTerm direction=float<cr>', 'Floating terminal' },
            v = { '<cmd>ToggleTerm direction=vertical size=40<cr>', 'Terminal in a vertical split' },
            h = { '<cmd>ToggleTerm direction=horizontal size=10<cr>', 'Terminal in a horizontal split' },
            p = {
              string.format([[<cmd>TermExec cmd='conda activate %s; ipython -i'<cr>]], os.getenv 'CONDA_DEFAULT_ENV'),
              'Open ipython',
            },
          },
          g = {
            name = '+git',
            w = { '<cmd>Gwrite<cr>', 'Add current buffer changes (Gwrite)' },
            r = { '<cmd>Gread<cr>', 'Read the last commited state (Gread)' },
            s = { '<cmd>Git<cr>', 'Git status' },
            d = { '<cmd>Gdiff<cr>', 'Show difference with the last commit' },
            c = { '<cmd>Git commit<cr>', 'Commit changes' },
            a = { '<cmd>Git commit --amend<cr>', 'commit --amend' },
            D = { '<cmd>GDelete<cr>', 'GDelete' },
          },
          r = {
            name = '+ranger',
            a = { '<cmd>RnvimrToggle<cr>', 'Open ranger' },
            r = { '<cmd>RnvimrResize<cr>', 'Resize ranger' },
          },
          o = {
            name = '+obsidian',
            b = { '<cmd>ObsidianBackLinks<cr>', 'Show links to this buffer' },
            d = { '<cmd>ObsidianToday<cr>', 'Create daily note' },
            y = { '<cmd>ObsidianYesterday<cr>', "Open yesterday's note" },
            o = { '<cmd>ObsidianOpen<cr>', 'Open note in Obsidian' },
            n = { '<cmd>ObsidianNew<cr>', 'New note' },
            f = { '<cmd>ObsidianSearch<cr>', 'Find note' },
            q = { '<cmd>ObsidianQuickSwitch<cr>', 'Quick switch' },
            l = { '<cmd>ObsidianLink<cr>', 'Link visual selection to a note' },
            L = { '<cmd>ObsidianLinkNew<cr>', 'Link visual selection to a new note' },
            g = { '<cmd>ObsidianFollowLink<cr>', 'Go to link (follow)' },
            t = { '<cmd>ObsidianTemplate<cr>', 'Insert a template' },
            e = { '<cmd>lua require("nabla").popup()<cr>', 'Equation' },
          },
          u = {
            name = '+undotree',
            t = { '<cmd>UndotreeToggle<CR>', 'Toggle undotree' },
          },
        },
      }
    end,
  },
  {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup {}
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('config.lualine').setup()
    end,
  },
  {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }, -- optional, for file icon
    -- tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function()
      require('nvim-tree').setup { view = { width=50 } }
      vim.keymap.set('n', '<leader>no', require('nvim-tree.api').tree.open, { desc = '[N]vim-tree [O]pen' })
    end
  },

  -- {
  --   'rose-pine/neovim',
  --   config = function()
  --     vim.cmd 'colorscheme rose-pine-moon'
  --   end,
  -- },
   {
    "sainnhe/everforest",
    config = function()
      vim.cmd "colorscheme everforest"
    end,
  },
  {
    'epwalsh/obsidian.nvim',
    event = 'BufReadPre ' .. vim.fn.expand '~' .. '/Documents/notes/**.md',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('config.obsidian').setup()
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<c-\>]],
        -- size = 10,
        direction = 'float',
      }
    end,
  },
  -- {
  --   "christoomey/vim-tmux-navigator",
  --   config = function()
  --     vim.g.tmux_navigator_no_mappings = 1
  --     vim.keymap.set('n', '<c-j>', ':<C-U>TmuxNavigateDown<cr>')
  --     vim.keymap.set('n', '<c-k>', ':<C-U>TmuxNavigateUp<cr>')
  --     vim.keymap.set('n', '<c-h>', ':<C-U>TmuxNavigateLeft<cr>')
  --     vim.keymap.set('n', '<c-l>', ':<C-U>TmuxNavigateRight<cr>')
  --   end
  -- },
  require 'plugins.harpoon',
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    tag = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = 'make install_jsregexp',
  },
  'mbbill/undotree',
}
-- end)
