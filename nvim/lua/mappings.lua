local map = vim.keymap.set

---@diagnostic disable-next-line: undefined-global
vim.g.mapleader = ' '
---@diagnostic disable-next-line: undefined-global
vim.g.maplocalleader = '\\'

-- up and down when the lines are wrapped
-- behave like the regular up and down
map('n', 'j', 'gj', {desc = 'move down one line, even for wrapped lines'})
map('n', 'k', 'gk', {desc = 'move up one line, even for wrapped lines'})

map('n', '/', '/\\v')
map('v', '/', '/\\v')


map('i', '<c-d>', '<del>', {desc = 'delete one char to the right'})
map('n', 'gp', '`[v`]', {desc = 'select last paste'})  -- select last paste
map('n', '<cr>', 'a<cr><esc>', {desc = 'break the line'})
map('i', '<C-l>', '<C-G>U<right>', {desc = 'move cursor one char to the right'})
map('i', '<C-h>', '<C-G>U<left>', {desc = 'move cursor one char to the right'})

map('n', '<c-s>', ':w<CR>', {desc = 'save current buffer'})
map('i', '<c-s>', '<ESC>:w<CR>a', {desc = 'save current buffer'})


-- split navigations
-- map({'t', 'i'}, "<M-h>", "<C-\\><C-N><C-w>h", {desc = 'Move one pane to the left'})
-- map({'t', 'i'}, "<M-j>", "<C-\\><C-N><C-w>j", {desc = 'Move one pane down'})
-- map({'t', 'i'}, "<M-k>", "<C-\\><C-N><C-w>k", {desc = 'Move one pane up'})
-- map({'t', 'i'}, "<M-l>", "<C-\\><C-N><C-w>l", {desc = 'Move one pane to the right'})
-- map({'t', 'i'}, "<M-q>", "<C-\\><C-N><C-w>q", {desc = 'Close pane'})
map('t', "<C-h>", "<C-\\><C-N><C-w>h", {desc = 'Move one pane to the left'})
map('t', "<C-j>", "<C-\\><C-N><C-w>j", {desc = 'Move one pane down'})
map('t', "<C-k>", "<C-\\><C-N><C-w>k", {desc = 'Move one pane up'})
map('t', "<C-l>", "<C-\\><C-N><C-w>l", {desc = 'Move one pane to the right'})

map({'t', 'i'}, "<C-q>", "<C-\\><C-N><C-w>q", {desc = 'Close pane'})
map({'n', 'v'}, "<C-q>", "<C-w>q", {desc = 'Close pane'})

-- map({'n', 'v'}, "<M-h>", "<C-w>h", {desc = 'Move one pane to the left'})
-- map({'n', 'v'}, "<M-j>", "<C-w>j", {desc = 'Move one pane down'})
-- map({'n', 'v'}, "<M-k>", "<C-w>k", {desc = 'Move one pane up'})
-- map({'n', 'v'}, "<M-l>", "<C-w>l", {desc = 'Move one pane to the right'})
map('n', "<Up>",  "<C-W>+", {desc = 'Increase pane size vertically'})
map('n', "<Down>",  "<C-W>-", {desc = 'Decrease pane size vertically'})
map('n', "<Right>",  "<C-W>>", {desc = 'Increase pane size horizontally'})
map('n', "<Left>",  "<C-W><", {desc = 'Decrease pane size horizontally'})
map('t', "<Esc>",  "<C-\\><C-n>", {desc = 'Exit to normal mode'})

map('n', "<LocalLeader><LocalLeader>", "<cmd>ToggleTermSendCurrentLine<cr>")
map('v', "<LocalLeader><LocalLeader>", ":ToggleTermSendVisualLines<cr>")
-- require("toggleterm").exec

map(
  {'n', 'v', 'o'}, '*', '<Plug>(asterisk-z*)',
  {noremap = false, desc = 'Star-search for word under cursor'}
)
map({'n', 'v', 'o'}, '#', '<Plug>(asterisk-gz*)', {noremap = false})

local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    f = {
      name = "+find",
      f = { "<cmd>Telescope find_files<cr>", "Files" },
      h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
      l = { "<cmd>Telescope live_grep<cr>", "Lines" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    },
    p = {
      name = "+packer",
      u = { "<cmd>PackerUpdate<cr>", "Update packages"},
      i = { "<cmd>PackerInstall<cr>", "Install packages"},
      s = { "<cmd>PackerSync<cr>", "Sync packages"},
      c = { "<cmd>PackerClean<cr>", "Clean packages"},
      g = { "<cmd>PackerStatus<cr>", "Get packages status"},
    },
    e = {
      name = "+edit",
      i = { "<cmd>edit $MYVIMRC<cr>", "Edit init.vim"},
      p = { "<cmd>edit $HOME/.dotfiles/nvim/lua/plugins.lua<cr>", "Edit plugins"},
      m = { "<cmd>edit $HOME/.dotfiles/nvim/lua/mappings.lua<cr>", "Edit mappings"},
      s = { "<cmd>edit $HOME/.dotfiles/nvim/lua/settings.lua<cr>", "Edit settings"},
      t = {
        "<cmd>edit $HOME/.dotfiles/nvim/lua/plugins_config/treesitter_config.lua<cr>",
        "Edit treesitter settings"
      },
      y = { "<cmd>edit $HOME/.dotfiles/nvim/ftplugin/python.vim<cr>", "Edit python settings"},
      l = { "<cmd>edit $HOME/.dotfiles/nvim/ftplugin/lua.vim<cr>", "Edit lua settings"},
      c = { "<cmd>edit $HOME/.dotfiles/nvim/lua/colors.lua<cr>", "Edit colors"},
    },
    n = {
      name = "+nvim-tree",
      o = { "<cmd>NvimTreeOpen<cr>", "Open tree"},
      f = { "<cmd>NvimTreeFindFile<cr>", "Find current file in tree"},
    },
    t = {
      name = "+terminal",
      f = {"<cmd>ToggleTerm direction=float<cr>", "Floating terminal"},
      v = {"<cmd>ToggleTerm direction=vertical size=40<cr>", "Terminal in a vertical split"},
      h = {"<cmd>ToggleTerm direction=horizontal size=10<cr>", "Terminal in a horizontal split"},
      p = {[[<cmd>TermExec cmd='conda activate kalman; ipython -i -c "import numpy as np"'<cr>]], "Open ipython"},
    },
    g = {
      name = "+git",
      w = {"<cmd>Gwrite<cr>", "Add current buffer changes (Gwrite)"},
      r = {"<cmd>Gread<cr>", "Read the last commited state (Gread)"},
      s = {"<cmd>Git<cr>", "Git status"},
      d = {"<cmd>Gdiff<cr>", "Show difference with the last commit"},
      c = {"<cmd>Git commit<cr>", "Commit changes"},
      a = {"<cmd>Git commit --amend<cr>", "commit --amend"},
    },
    r = {
      name = "+ranger",
      a = {"<cmd>RnvimrToggle<cr>", "Open ranger"},
      r = {"<cmd>RnvimrResize<cr>", "Resize ranger"},
    },
    o = {
      name = "+obsidian",
      b = {"<cmd>ObsidianBackLinks<cr>", "Show links to this buffer"},
      t = {"<cmd>ObsidianToday<cr>", "Create today's note"},
      y = {"<cmd>ObsidianYesterday<cr>", "Open yesterday's note"},
      o = {"<cmd>ObsidianOpen<cr>", "Open note in Obsidian"},
      n = {"<cmd>ObsidianNew<cr>", "New note"},
      f = {"<cmd>ObsidianSearch<cr>", "Find note"},
      q = {"<cmd>ObsidianQuickSwitch<cr>", "Quick switch"},
      l = {"<cmd>ObsidianLink<cr>", "Link visual selection to a note"},
      L = {"<cmd>ObsidianLinkNew<cr>", "Link visual selection to a new note"},
      g = {"<cmd>ObsidianFollowLink<cr>", "Go to link (follow)"},
      T = {"<cmd>ObsidianTemplate<cr>", "Insert a template"},
      e = {'<cmd>lua require("nabla").popup()<cr>', "Equation"}
    },
  },
})
