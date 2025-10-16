local M = {}
local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'
local builtin = require 'telescope.builtin'

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

local function find_project_folders()
  local root = get_root()

  -- Use fd to locate all pyproject.toml files and extract their directories
  local find_cmd = string.format("fd -t f '(pyproject.toml|package.json)' '%s' -E '.venv' -E 'node_modules' -x dirname", root)
  local result = vim.fn.system(find_cmd)

  if vim.v.shell_error ~= 0 then
    vim.notify(string.format('fd command returned nonzero exit status: %d', vim.v.shell_error), vim.log.levels.ERROR)
    return
  end

  local folders = {}
  for line in result:gmatch '[^\n]+' do
    local relative_path = line:gsub('^' .. vim.pesc(root) .. '/', '')
    local segments = #vim.split(relative_path, '/')
    table.insert(folders, {
      path = line,
      display = vim.fn.fnamemodify(line, ':t') .. ' (' .. relative_path .. ')',
      ordinal = string.format('%02d_%s', segments, relative_path),
    })
  end

  return folders
end

local function pyproject_picker(opts)
  opts = opts or {}

  local folders = find_project_folders()

  if #folders == 0 then
    vim.notify('No folders with pyproject.toml found', vim.log.levels.WARN)
    return
  end

  pickers
    .new(opts, {
      prompt_title = 'Projects (pyproject.toml | package.json)',
      finder = finders.new_table {
        results = folders,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry.display,
            ordinal = entry.ordinal,
            path = entry.path,
          }
        end,
      },
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          if selection and selection.value and selection.value.path then
            vim.schedule(function()
              builtin.live_grep {
                cwd = selection.value.path,
                prompt_title = 'Search in ' .. vim.fn.fnamemodify(selection.value.path, ':t'),
              }
            end)
          end
        end)

        map('i', '<C-f>', function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          if selection and selection.value and selection.value.path then
            vim.schedule(function()
              builtin.find_files {
                cwd = selection.value.path,
                prompt_title = 'Files in ' .. vim.fn.fnamemodify(selection.value.path, ':t'),
              }
            end)
          end
        end)

        map('i', '<C-t>', function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          if selection and selection.value and selection.value.path then
            vim.schedule(function()
              vim.cmd 'terminal'
              vim.api.nvim_chan_send(vim.b.terminal_job_id, 'source .venv/bin/activate; cd ' .. vim.fn.shellescape(selection.value.path) .. '\n')
            end)
          end
        end)

        map('i', '<C-d>', function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          if selection and selection.value and selection.value.path then
            vim.schedule(function()
              vim.cmd('Oil ' .. vim.fn.fnameescape(selection.value.path))
            end)
          end
        end)

        return true
      end,
    })
    :find()
end

M.setup = function()
  vim.keymap.set('n', '<leader>sp', pyproject_picker, { desc = '[P]yproject folders' })
end

return M
