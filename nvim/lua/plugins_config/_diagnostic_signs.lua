local signs = { Error = " ", Warn = " ", Info = " ", Hint = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  ---@diagnostic disable-next-line: undefined-global
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
---@diagnostic disable-next-line: undefined-global
vim.diagnostic.config({
  update_in_insert = false,
  ---@diagnostic disable-next-line: undefined-global
  -- virtual_text = {source = false, severity = {min = vim.diagnostic.severity.INFO}},
  virtual_text = false,
  signs = true,
})
