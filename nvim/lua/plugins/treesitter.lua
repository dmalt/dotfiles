return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup({
      ensure_installed = { 'bash', 'lua', 'markdown', 'vim', 'vimdoc', 'python', 'go' },
    })

    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
