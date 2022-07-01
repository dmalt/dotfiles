return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}

  use { 'tpope/vim-surround' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-unimpaired' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-fugitive' }
  use { 'kassio/neoterm' }
  use { 'michaeljsmith/vim-indent-object' }
  use { 'rafi/awesome-vim-colorschemes' }
  use { 'kana/vim-textobj-entire' }
  use { 'tommcdo/vim-exchange' }
  use { 'machakann/vim-highlightedyank' }
  use { 'SirVer/ultisnips' }
  use { 'honza/vim-snippets' }
  use { 'jiangmiao/auto-pairs' }
  use { 'haya14busa/is.vim' }
  ---@diagnostic disable-next-line: undefined-global
  use { 'haya14busa/vim-asterisk', config = function() vim.g["asterisk#keeppos"] = 1 end}
  use { 'yuttie/comfortable-motion.vim' }
  use { 'fisadev/vim-isort', ft = { "python" } }
  use { 'bps/vim-textobj-python', ft = { "python" }, requires = { "kana/vim-textobj-user" } }
  use { 'junegunn/goyo.vim' }
  use { 'junegunn/limelight.vim' }
  use { 'dense-analysis/ale' }

  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'hrsh7th/nvim-cmp',
  }
  use {
    "folke/which-key.nvim",
    config = function() require("which-key").setup {} end
  }

  use {
    'kyazdani42/nvim-web-devicons',
    config = function() require('nvim-web-devicons').setup {}
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require("lualine").setup{
      options = {
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        globalstatus = true,
      },
      sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename', 'tabs'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
      },
    } end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }, -- optional, for file icon
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function() require('nvim-tree').setup { view = {width = 50} } end
  }

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ---@diagnostic disable-line: undefined-global
    ft = { "markdown" },
  })

  use { 'nvim-lua/plenary.nvim' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'nvim-treesitter/nvim-treesitter' }
  -- use { 'neovim/nvim-lspconfig' }
  use { "williamboman/nvim-lsp-installer" }
  use { "neovim/nvim-lspconfig" }
  -- use { 'williamboman/nvim-lsp-installer' }
  use { 'lervag/vimtex', ft = { "latex" } }
  use { 'psf/black' }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require('indent_blankline').setup {show_current_context = true} end
  }
  use {
    'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end
    -- tag = 'release' -- To use the latest release
  }
  use { 'kevinhwang91/rnvimr' }
end)
