local M = {}

local nls = require "null-ls"
local nls_utils = require "null-ls.utils"
local b = nls.builtins
local line_length = 88

local with_diagnostics_code = function(builtin)
  return builtin.with {
    diagnostics_format = "#{m} [#{c}]",
  }
end

local with_root_file = function(builtin, file)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

local sources = {
  -- formatting
  b.formatting.isort.with({ extra_args = { "--line-length", line_length } }),
  b.formatting.black.with({ extra_args = { "--line-length", line_length } }),
  b.formatting.prettierd,
  with_root_file(b.formatting.stylua, "stylua.toml"),

  -- diagnostics
  b.diagnostics.write_good,
  b.diagnostics.markdownlint,
  b.diagnostics.eslint,
  b.diagnostics.flake8.with({
    extra_args = { "--ignore",  "E203,W503,E704", "--max-line-length", "88" }
  }),
  -- b.diagnostics.flake8,
  b.diagnostics.mypy,
  b.diagnostics.tsc,
  with_root_file(b.diagnostics.selene, "selene.toml"),
  with_diagnostics_code(b.diagnostics.shellcheck),

  -- code actions
  b.code_actions.gitsigns,
  b.code_actions.gitrebase,

  -- hover
  b.hover.dictionary,
}

function M.setup(opts)
  nls.setup {
    -- debug = true,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = function(client, bufnr)
      opts.on_attach(client, bufnr)

      -- workaround for broken gq line wrapper copied from
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1131#issuecomment-1432408485
      vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")
    end,
    root_dir = nls_utils.root_pattern ".git",
  }
end

return M
