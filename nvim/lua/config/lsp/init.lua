local M = {}

function M.setup()
  local lsp = require('lsp-zero').preset({
    name = 'minimal', set_lsp_keymaps = false, manage_nvim_cmp = true, suggest_lsp_servers = false
  })
  lsp.on_attach(function(client, bufnr) require("config.lsp.keymaps").setup(client, bufnr) end)
  -- (Optional) Configure lua language server for neovim
  lsp.nvim_workspace()
  lsp.setup()

  require("config.lsp.handlers").setup()

  local lsp_signature = require "lsp_signature"
  lsp_signature.setup { bind = true, handler_opts = { border = "rounded" } }
end

return M
