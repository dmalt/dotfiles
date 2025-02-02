local M = {}
print 'hello'

--- @param bufnumber integer
local function show_mypy(bufnumber)
  if not bufnumber then
    error "can't convert bufnumber to int"
  end
  local bufname = vim.api.nvim_buf_get_name(bufnumber)
  print('bufname: ', bufname)
  local ns_id = vim.api.nvim_create_namespace('highlights ' .. bufname)
  vim.fn.jobstart({ 'poetry', 'run', 'mypy', '--output', 'json', bufname }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if not data then
        return
      end
      vim.print 'DATA'
      vim.print(data)
      -- vim.api.nvim_buf_set_lines(51, 0, 0, false, data)

      for _, line in ipairs(data) do
        if line == '' then
          break
        end
        local decoded = vim.json.decode(line)
        vim.print(decoded['line'], decoded['message'])
        local line_num = tonumber(decoded['line'])
        assert(line_num)
        -- vim.api.nvim_buf_set_extmark(bufnumber, ns_id, decoded['line'], 0, { virt_text = decoded['message'] })
        -- vim.api.nvim_buf_set_extmark(bufnumber, ns_id, line_num, 5, opts)
        local diagnostic = {
            message = "hello, world",
            lnum = line_num - 1,  -- 0-based line number
            col = 0,    -- 0-based column number
            severity = vim.diagnostic.severity.ERROR, -- or WARNING, INFO, HINT
            source = "mypy-custom",
            bufnr = bufnumber   -- buffer number (0 for current buffer)
        }
        vim.diagnostic.set(ns_id, bufnumber, {diagnostic})
        vim.diagnostic.setloclist()
      end
    end,
  })
end
M.show_mypy = show_mypy
vim.api.nvim_create_user_command('SayHello', show_mypy, {})
return M
-- /Users/dmitriialtukhov/.config/nvim,
-- /Users/dmitriialtukhov/.local/share/nvim/site,
-- /opt/homebrew/Cellar/neovim/0.10.2_1/share/nvim/runtime,
-- /opt/homebrew/Cellar/neovim/0.10.2_1/share/nvim/runtime/pack/dist/opt/matchit,
-- /opt/homebrew/Cellar/neovim/0.10.2_1/lib/nvim,
-- /Users/dmitriialtukhov/.config/nvim/after,
