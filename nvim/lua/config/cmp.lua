local M = {}
-- Setup nvim-cmp.


local cmp = require 'cmp'

local function my_select(direction)
  local map = {next = cmp.select_next_item, prev = cmp.select_prev_item}
  return function()
    if cmp.visible()then
      map[direction]({ behavior = cmp.SelectBehavior.Replace })
    else
      cmp.complete()
    end
  end
end

function M.setup()
  vim.opt.completeopt= "menu,menuone,preview,noselect"
  -- vim.opt.completeopt= "noselect"

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
          local ls = require("luasnip")
          ls.lsp_expand(args.body)
      end,
    },
    window = {documentation = cmp.config.window.bordered()},
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-3),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
      ['<C-n>'] = cmp.mapping({ c = my_select("next"), i = my_select("next") }),
      ['<C-p>'] = cmp.mapping({ c = my_select("prev"), i = my_select("prev") }),
      ['<Tab>'] = cmp.mapping({ c = cmp.config.disable, i = cmp.config.disable }),
    }),
    sources = cmp.config.sources(
      {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua'},
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
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
