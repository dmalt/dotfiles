local g = vim.g

---@diagnostic disable-next-line: undefined-global
-- vim.cmd("colorscheme solarized8_low")
-- vim.cmd("colorscheme seoul256")
vim.cmd("highlight VertSplit ctermbg=NONE guibg=NONE")

local colors = {
  gray1 = '#3f3f3f',
  red1 = '#705050',
  green1 = '#60b48a',
  yellow1 = '#dfaf8f',
  blue1 = '#dfaf8f',
  purple1 = '#dc8cc3',
  green2 = '#8cd0d3',
  white1 = '#dcdccc',
  gray2 = '#709080',
  red2 = '#dca3a3',
  green3 = '#c3bf9f',
  yellow2 = '#f0dfaf',
  blue2 = '#94bff3',
  purple2 = '#ec93d3',
  green4 = '#93e0e3',
  white2 = '#ffffff',
}

g.terminal_color_0 = colors.gray1
g.terminal_color_1 = colors.red1
g.terminal_color_2 = colors.green1
g.terminal_color_3 = colors.yellow1
g.terminal_color_4 = colors.blue1
g.terminal_color_5 = colors.purple1
g.terminal_color_6 = colors.green2
g.terminal_color_7 = colors.white1
g.terminal_color_8 = colors.gray2
g.terminal_color_9 = colors.red2
g.terminal_color_10 = colors.green3
g.terminal_color_11 = colors.yellow2
g.terminal_color_12 = colors.blue2
g.terminal_color_13 = colors.purple2
g.terminal_color_14 = colors.green4
g.terminal_color_15 = colors.white2
