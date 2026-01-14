return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        python = { 'mypy' },
      }

      -- Configure mypy to use venv installation instead of system/Mason
      local venv = os.getenv('VIRTUAL_ENV')
      if venv then
        local venv_mypy = venv .. '/bin/mypy'
        if vim.fn.executable(venv_mypy) == 1 then
          lint.linters.mypy.cmd = venv_mypy
          -- Make error code optional so reveal_type() notes work
          lint.linters.mypy.parser = require('lint.parser').from_pattern(
            '([^:]+):(%d+):(%d+):(%d+):(%d+): (%a+): (.-)%s*%[?([%a-]*)%]?$',
            { 'file', 'lnum', 'col', 'end_lnum', 'end_col', 'severity', 'message', 'code' },
            { error = vim.diagnostic.severity.ERROR, warning = vim.diagnostic.severity.WARN, note = vim.diagnostic.severity.HINT },
            { source = 'mypy' },
            { end_col_offset = 0 }
          )
        end
      end

    -- Set mypy to work in virtualenv
      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      -- lint.linters_by_ft = lint.linters_by_ft or {}
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      --
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }
      --
      -- You can disable the default linters by setting their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil
      -- lint.linters_by_ft['dockerfile'] = nil
      -- lint.linters_by_ft['inko'] = nil
      -- lint.linters_by_ft['janet'] = nil
      -- lint.linters_by_ft['json'] = nil
      -- lint.linters_by_ft['markdown'] = nil
      -- lint.linters_by_ft['rst'] = nil
      -- lint.linters_by_ft['ruby'] = nil
      -- lint.linters_by_ft['terraform'] = nil
      -- lint.linters_by_ft['text'] = nil

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
