local M = {}
local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local make_entry = require 'telescope.make_entry'
local conf = require('telescope.config').values

local function get_root()
  local git_cmd = vim.fn.system 'git rev-parse --show-toplevel'

  -- Check if we're in a git repo
  if vim.v.shell_error == 0 then
    -- In a git repo, trim the trailing newline
    return git_cmd:gsub('\n$', '')
  else
    -- Not in a git repo, use current working directory
    return vim.uv.cwd()
  end
end

local function create_multigrep_picker(opts, command_generator_fn, title)
  opts = opts or {}
  local finder = finders.new_async_job {
    command_generator = command_generator_fn,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers
    .new(opts, {
      debounce = 100,
      prompt_title = title,
      finder = finder,
      previewer = conf.grep_previewer(opts),
      sorter = require('telescope.sorters').empty(),
      layout_config = {
        horizontal = {
          width = 0.95,
          preview_width = 0.4,
        },
      },
    })
    :find()
end

local live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = get_root()

  local command_generator = function(prompt)
    if not prompt or prompt == '' then
      return nil
    end

    local pieces = vim.split(prompt, '  ')
    local args = { 'rg' }
    if pieces[1] then
      table.insert(args, '-e')
      table.insert(args, pieces[1])
    end

    if pieces[2] then
      table.insert(args, '-g')
      table.insert(args, pieces[2])
    end
    return vim.tbl_flatten {
      args,
      {
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '-g',
        '!.venv',
        '-g',
        '!.mypy_cache',
      },
    }
  end

  create_multigrep_picker(opts, command_generator, 'Multi Grep')
end

local live_multigrep_cwd = function(opts)
  opts = opts or {}
  opts.cwd = vim.uv.cwd()

  local command_generator = function(prompt)
    if not prompt or prompt == '' then
      return nil
    end

    local pieces = vim.split(prompt, '  ')
    local args = { 'rg' }
    if pieces[1] then
      table.insert(args, '-e')
      table.insert(args, pieces[1])
    end

    if pieces[2] then
      table.insert(args, '-g')
      table.insert(args, '*' .. pieces[2] .. '*/**')
    end
    return vim.tbl_flatten {
      args,
      {
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '-g',
        '!.venv',
        '-g',
        '!.mypy_cache',
        '-g',
        '!poetry.lock',
      },
    }
  end

  create_multigrep_picker(opts, command_generator, 'Multi Grep CWD')
end

M.setup = function()
  vim.keymap.set('n', '<leader>sm', live_multigrep, { desc = '[M]ultigrep' })
  vim.keymap.set('n', '<leader>sc', function()
    local opts = require('telescope.themes').get_ivy()
    live_multigrep_cwd(opts)
  end, { desc = 'Multigrep [C]WD' })
end

-- live_multigrep()
return M
