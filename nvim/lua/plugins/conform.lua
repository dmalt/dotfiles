return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      print 'autofmt'
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      python = { 'isort', 'black' },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
    },
  },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      '<leader>cf',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
}
-- {
--   'stevearc/conform.nvim',
--   event = { 'BufWritePre' },
--   cmd = { 'ConformInfo' },
--   -- keys = {
--   --   {
--   --     -- Customize or remove this keymap to your liking
--   --     '<leader>cf',
--   --     function()
--   --       require('conform').format { async = true, lsp_fallback = true }
--   --     end,
--   --     mode = '',
--   --     desc = 'Format buffer',
--   --   },
--   -- },
--   -- Everything in opts will be passed to setup()
--   opts = {
--     -- Define your formatters
--     formatters_by_ft = {
--       lua = { 'stylua' },
--       python = { 'isort', 'black' },
--       javascript = { { 'prettierd', 'prettier' } },
--     },
--     -- Customize formatters
--     formatters = {
--       shfmt = {
--         prepend_args = { '-i', '2' },
--       },
--     },
--   },
--   format_on_save = function(bufnr)
--     -- Disable "format_on_save lsp_fallback" for languages that don't
--     -- have a well standardized coding style. You can add additional
--     -- languages here or re-enable it for the disabled ones.
--     local disable_filetypes = { c = true, cpp = true }
--     return {
--       timeout_ms = 500,
--       lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
--     }
--   end,
--   init = function()
--     -- If you want the formatexpr, here is the place to set it
--     vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
--   end,
-- },
