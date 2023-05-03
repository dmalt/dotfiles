local M = {}

local utils = require "utils"
local nls_utils = require "config.lsp.null-ls.utils"
local nls_sources = require "null-ls.sources"
local api = vim.api

local method = require("null-ls").methods.FORMATTING

M.autoformat = true

function M.toggle()
  M.autoformat = not M.autoformat
  if M.autoformat then
    utils.info("Enabled format on save", "Formatting")
  else
    utils.warn("Disabled format on save", "Formatting")
  end
end

function M.format()
  if M.autoformat then
    vim.lsp.buf.format({timeout_ms=2000})
  end
end

function M.setup(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

  if M.has_formatter(filetype) then
    vim.keymap.set('n', "<leader>af", function() vim.schedule(M.format) end, {desc = "Autoformat"})
  end
end

function M.has_formatter(filetype)
  local available = nls_sources.get_available(filetype, method)
  return #available > 0
end

function M.list_registered(filetype)
  local registered_providers = nls_utils.list_registered_providers_names(filetype)
  return registered_providers[method] or {}
end

function M.list_supported(filetype)
  local supported_formatters = nls_sources.get_supported(filetype, "formatting")
  table.sort(supported_formatters)
  return supported_formatters
end

return M
