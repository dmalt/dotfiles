local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  { import = 'plugins' },
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  -- 'tpope/vim-surround',
  -- 'tpope/vim-commentary',
  'tpope/vim-unimpaired',
  'tpope/vim-repeat',
  'mbbill/undotree',
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  -- 'michaeljsmith/vim-indent-object',
  -- 'tommcdo/vim-exchange',
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Add indentation guides even on blank lines
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
  -- 'nvim-lua/plenary.nvim',
  -- 'Integralist/vim-mypy',
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    -- tag = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    version = 'v2.*',
    -- install jsregexp (optional!:).
    run = 'make install_jsregexp',
  },
  {
    'rmagatti/auto-session',
    lazy = false,
    enabled = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    },
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  { 'rust-lang/rust.vim' },
  -- {
  --   'VonHeikemen/lsp-zero.nvim',
  --   branch = 'v1.x',
  --   config = function()
  --     require('config.lsp').setup()
  --     require('plugins.cmp').setup()
  --   end,
  --   -- wants = { "LuaSnip" },
  --   dependencies = {
  --     'hrsh7th/nvim-cmp',
  --     'neovim/nvim-lspconfig',
  --     'williamboman/mason.nvim', -- Optional
  --     'williamboman/mason-lspconfig.nvim', -- Optional
  --     'hrsh7th/cmp-buffer',
  --     'hrsh7th/cmp-path',
  --     'hrsh7th/cmp-nvim-lua',
  --     'ray-x/cmp-treesitter',
  --     'hrsh7th/cmp-cmdline',
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-nvim-lua',
  --     'hrsh7th/cmp-nvim-lsp-signature-help',
  --     'saadparwaiz1/cmp_luasnip',
  --     'folke/neodev.nvim',
  --     'jose-elias-alvarez/null-ls.nvim',
  --     {
  --       'j-hui/fidget.nvim',
  --       config = function()
  --         require('fidget').setup {}
  --       end,
  --     },
  --   },
  --   disable = false,
  -- },
  --
  -- {
  --   'kyazdani42/nvim-web-devicons',
  --   config = function()
  --     require('nvim-web-devicons').setup {}
  --   end,
  -- },
}
