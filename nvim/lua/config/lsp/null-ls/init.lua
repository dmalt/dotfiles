local M = {}

local nls = require "null-ls"
local nls_utils = require "null-ls.utils"
local b = nls.builtins
local line_length = 99

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
  b.formatting.prettierd,
  b.formatting.shfmt,
  b.formatting.fixjson,
  b.formatting.black.with({ extra_args = { "--line-length", line_length } }),
  b.formatting.isort,
  with_root_file(b.formatting.stylua, "stylua.toml"),

  -- diagnostics
  b.diagnostics.write_good,
  b.diagnostics.markdownlint,
  -- b.diagnostics.eslint_d,
  b.diagnostics.flake8.with({
    extra_args = {
      "--ignore E203 W503 E704",
      string.format("--max-line-length %s", line_length)}
  }),
  -- b.diagnostics.flake8,
  b.diagnostics.tsc,
  with_root_file(b.diagnostics.selene, "selene.toml"),
  with_diagnostics_code(b.diagnostics.shellcheck),

  -- code actions
  b.code_actions.gitsigns,
  b.code_actions.gitrebase,

  -- hover
  b.hover.dictionary,
}

function M.setup()
  nls.setup {
    -- debug = true,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    -- on_attach = opts.on_attach, not needed since we use lsp-zero
    root_dir = nls_utils.root_pattern ".git",
  }
end

return M
