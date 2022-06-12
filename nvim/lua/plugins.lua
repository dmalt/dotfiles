return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use {
        "folke/which-key.nvim",
        config = function() require("which-key").setup {} end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require("lualine").setup{} end
      }

    use { 'tpope/vim-surround' }
    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-unimpaired' }
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-fugitive' }
    use { 'kassio/neoterm' }
    use { 'michaeljsmith/vim-indent-object' }
    use { 'rafi/awesome-vim-colorschemes' }
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })

    use { 'nvim-lua/plenary.nvim' }
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/nvim-lsp-installer' }
end)
