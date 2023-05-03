local M = {}

function M.setup()
  require("neodev").setup({})

  local lsp = require('lsp-zero').preset({
    name = 'minimal', set_lsp_keymaps = false, manage_nvim_cmp = true, suggest_lsp_servers = false
  })
  lsp.on_attach(
    function(client, bufnr)
      require("config.lsp.keymaps").setup(client, bufnr)
      require("config.lsp.null-ls.formatters").setup(client, bufnr)
    end)
  -- (Optional) Configure lua language server for neovim
  lsp.nvim_workspace()
  lsp.setup()

  require("config.lsp.handlers").setup()

  -- local lsp_signature = require "lsp_signature"
  -- lsp_signature.setup { bind = true, handler_opts = { border = "rounded" } }

  lsp.configure(
    "lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT", path = vim.split(package.path, ";", {}) },
          diagnostics = { globals = { "vim" } }, -- Ensure `vim` global recognized 
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            },
          },
        },
      }
    }
  )

  require("config.lsp.null-ls").setup()
  end

return M
