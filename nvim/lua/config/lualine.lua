local M = {}

local function lsp_client(msg)
  msg = msg or ""
  local buf_clients = vim.lsp.get_active_clients()
  if next(buf_clients) == nil then
    if type(msg) == "boolean" or #msg == 0 then
      return ""
    end
    return msg
  end

  local buf_ft = vim.bo.filetype
  local buf_client_names = {}

  -- add client
  for _, client in pairs(buf_clients) do
    if client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
    end
  end

  -- add formatter
  local supported_formatters = require("config.lsp.null-ls.formatters").list_registered(buf_ft)
  vim.list_extend(buf_client_names, supported_formatters)

  -- add linter
  local linters = require "config.lsp.null-ls.linters"
  local supported_linters = linters.list_registered(buf_ft)
  vim.list_extend(buf_client_names, supported_linters)

  -- -- add hover
  -- local hovers = require "config.lsp.null-ls.hovers"
  -- local supported_hovers = hovers.list_registered(buf_ft)
  -- vim.list_extend(buf_client_names, supported_hovers)

  return "[" .. table.concat(buf_client_names, ", ") .. "]"
  -- return [[hello, beach]]
end

local function cwd()
  local path = vim.fn.getcwd()
  return '~' .. string.sub(path, #vim.env.HOME + 1)
end


function M.setup()
  -- local gps = require "nvim-gps"

  require("lualine").setup {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      -- section_separators = { left = " ", right = "" },
      section_separators = { left = '', right = ''},
      globalstatus = true,
      disabled_filetypes = {},
      -- always_divide_middle = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        "diff",
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = { error = " ", warn = " ", info = " ", hint = "" },
          colored = false,
        },
      },
      lualine_c = {
        { lsp_client,  icon = " ", color = { fg = vim.g.terminal_color_2, gui = "bold" } },
        -- { lsp_progress },
        -- {
        --   gps.get_location,
        --   cond = gps.is_available,
        --   color = { fg = colors.green },
        -- },
      },
      lualine_x = { cwd },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  }
end

return M
