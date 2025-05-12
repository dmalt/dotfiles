local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

---@param opts? { width?: number, height?: number }
---@return { buf: number, win: number }
local function create_float(opts)
  opts = opts or {}

  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)

  local win_opts = {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  }

  local win
  win = vim.api.nvim_open_win(buf, true, win_opts)
  return { buf = buf, win = win }
end

-- Usage
-- local win = create_float { width = 50, height = 20 } -- specific size
vim.api.nvim_create_user_command('Floaterminal', function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_float()
  else
    vim.api.nvim_win_hide(state.floating.win)
  -- print(vim.inspect(state.floating))
  end
end, {})
-- local win = create_float() -- 80% of screen
