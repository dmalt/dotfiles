local M = {}

function M.setup()
  -- Diagnostic signs
  local signs = { Error = "" ,  Warn = "" ,  Hint = "" ,  Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { texthl = hl, text = icon, numhl = hl })
  end

  -- Diagnostic configuration
  vim.diagnostic.config({
      -- virtual_text = false,
      virtual_text = { spacing = 12, prefix = "●", source = true },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = { focusable = true, style = "minimal", border = "rounded" },
  })

  -- Hover configuration
  local float_cfg = { focusable = true, style = "minimal", border = "rounded" }
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float_cfg)

  -- Signature help configuration
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, float_cfg)
end

return M
