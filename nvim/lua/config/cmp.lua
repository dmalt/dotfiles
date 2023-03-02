local M = {}
-- Setup nvim-cmp.


local cmp = require 'cmp'

local function my_select(direction)
  map = {next = cmp.select_next_item, prev = cmp.select_prev_item}
  return function()
    if cmp.visible() then
        map[direction]({ behavior = cmp.SelectBehavior.Insert })
    else
        cmp.complete()
    end
  end
end

function M.setup()
  ---@diagnostic disable-next-line: undefined-global
  vim.opt.completeopt={"menu", "menuone", "noselect", "preview"}

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        ---@diagnostic disable-next-line: undefined-global
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {documentation = cmp.config.window.bordered()},
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
   --[[
    Accept currently selected item.
     Set `select` to `false` to only confirm explicitly selected items.
   --]]
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
      ['<C-n>'] = cmp.mapping({ c = my_select("next"), i = my_select("next") }),
      ['<C-p>'] = cmp.mapping({ c = my_select("prev"), i = my_select("prev") }),
    }),
    sources = cmp.config.sources(
      {
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'buffer' },
        { name = 'path' }
      }
    )
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
end


return M

--local on_attach = function(client, bufnr)
--  -- Mappings.
--  -- See `:help vim.lsp.*` for documentation on any of the below functions
--  local bufopts = { noremap=true, silent=true, buffer=bufnr }
--  ---@diagnostic disable-next-line: undefined-global
--  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

--    -- Use LSP as the handler for formatexpr.
--    -- See `:help formatexpr` for more information.
--  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
--  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--  ---@diagnostic disable-next-line: undefined-global
--  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--  vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, bufopts)
--  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
--  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
--  vim.keymap.set('n', '<localleader>d', vim.diagnostic.open_float, bufopts)
--end
--  -- Setup lspconfig.
--local capabilities = require('cmp_nvim_lsp').default_capabilities(
--  ---@diagnostic disable-next-line: undefined-global
--  vim.lsp.protocol.make_client_capabilities()
--)
---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['pyright'].setup {
--  capabilities = capabilities,
--  on_attach = on_attach,
--  filetypes = { "python" }
--}
--require'lspconfig'.pylsp.setup{
--  on_attach=on_attach,
--  capabilities=capabilities,
--  filetypes = { "python" },
--  settings = {
--    pylsp = {
--      configurationSources = { "flake8" },
--      plugins = {
--        pycodestyle = { enabled = false },
--        flake8 = { enabled = true, ignore = {"E203"}, maxLineLength = 99 },
--        -- pylsp_mypy = { enabled = true, live_mode = false },  -- doesn't work for some reason
--        -- pyls_mypy = { enabled = true, live_mode = false },
--        -- mypy = { enabled = true, live_mode = false },
--      },
--    }
--  }
--}
