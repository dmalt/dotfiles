local function show_ls()
  local bufname = vim.api.nvim_buf_get_name(0)
  print(bufname)
  vim.fn.jobstart({ 'poetry', 'run', 'mypy', '--output', 'json', bufname }, {
    -- vim.fn.jobstart({"ls"}, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if not data then
        return
      end
      vim.print("DATA")
      vim.print(data)
      -- vim.api.nvim_buf_set_lines(51, 0, 0, false, data)
      for _, line in ipairs(data) do
        if line == "" then
          break
        end
        local decoded = vim.json.decode(line)
        vim.print(decoded['line'], decoded['message'])
      end
    end,
  })
end

vim.api.nvim_create_user_command('SayHello', show_ls, {})
