-- Setup nvim-cmp.
local cmp = require'cmp'

---@diagnostic disable-next-line: undefined-global
vim.opt.completeopt={"menu", "menuone", "noselect", "preview"}

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      ---@diagnostic disable-next-line: undefined-global
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {},
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<localleader>n'] = cmp.mapping.complete(),
    ['<localleader>e'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources(
  { { name = 'nvim_lsp' }, { name = 'ultisnips' }, },
  { { name = 'buffer' }, })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  ---@diagnostic disable-next-line: undefined-global
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  ---@diagnostic disable-next-line: undefined-global
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end
  -- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  ---@diagnostic disable-next-line: undefined-global
  vim.lsp.protocol.make_client_capabilities()
)
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require('lspconfig')['yamlls'].setup {}
require('lspconfig')['sumneko_lua'].setup {}
