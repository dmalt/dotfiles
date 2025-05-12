if vim.g.snippets ~= 'luasnip' then
  return
end

local ls = require 'luasnip'
local types = require 'luasnip.util.types'

ls.config.set_config {
  -- This tells LuaSnip to remoemver to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,
  -- update snippets as you type
  updateevents = 'TextChanged,TextChangedI',

  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { '<=', 'Error' } },
      },
    },
  },
}

vim.keymap.set({ 'i', 's' }, '<C-E>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

-- map("i", "<c-l>", function()
--   if ls.choice_active() then
--     ls.change_choice(1)
--   end
-- end)
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require('luasnip.extras').lambda
local rep = require('luasnip.extras').rep
local p = require('luasnip.extras').partial
local m = require('luasnip.extras').match
local n = require('luasnip.extras').nonempty
local dl = require('luasnip.extras').dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local types = require 'luasnip.util.types'
local conds = require 'luasnip.extras.conditions'
local conds_expand = require 'luasnip.extras.conditions.expand'

local function copy(args)
  return args[1]
end

local function date()
  return vim.fn.trim(vim.fn.system 'date +%Y-%m-%dT%H:%M')
end

local function fname2title()
  local fname = vim.fn.expand '%'
  local title = fname:gsub('_', ' ')
  title = title:gsub('^%l', string.upper)
  title = title:gsub('.md', '')
  return title
end

local function create_branch_format(args, snip, _, user_args)
  local count = tonumber(user_args) or tonumber(snip.captures[1])

  -- Start with the fixed prefix
  local inner = function()
    local nodes = {}
    table.insert(nodes, t 'git wa -b sai-')
    table.insert(nodes, i(1, "000"))

    -- Create the dynamic number of sections with insert nodes
    for ii = 2, count + 1 do
      table.insert(nodes, t '-')
      table.insert(nodes, i(ii, 'word' .. ii))
    end

    -- Add the second part with references to the first parts
    table.insert(nodes, t ' sai')
    for ii = 1, count + 1 do
      table.insert(nodes, t '_')
      table.insert(nodes, rep(ii))
    end
    return nodes
  end

  local nodes = inner()
  local nodes1 = inner()
  -- local nodes1 = {t'hello', i(1, ' world')}
  table.insert(nodes1, t " dmalt-dev")

  -- Optionally add dmalt-dev
  -- table.insert(nodes, t(" dmalt-dev"))  -- Uncomment if needed

  return sn(nil, c(1, {sn(nil, nodes), sn(nil, nodes1)}))
end

ls.add_snippets('all', {
  s('now', f(date)),
  s('wab', { d(1, create_branch_format, {}, {user_args={2}}) }),
  s(
    {
      trig = 'wab(%d+)', -- Regex pattern that captures digits after "wab"
      regTrig = true, -- Enable regex trigger
    },
    { d(1, create_branch_format) } -- Dynamic node that depends on the count
  ),
  s('wa', fmt('git wa sai_{}_{}_{} sai-{}-{}-{} ', { rep(1), rep(2), rep(3), i(1, '000'), i(2, 'branch'), i(3, 'name') })),
  s(
    'trig',
    c(1, {
      t 'Ugh boring, a text node',
      i(nil, 'At least I can edit something now...'),
      f(function(args)
        return 'Still only counts as text!!'
      end, {}),
    })
  ),
})

ls.add_snippets('markdown', {
  s(
    'head',
    fmt(
      [[
        ---
        title: {}
        dates: {}
        tags: {}
        ---
    ]],
      { i(1, fname2title()), f(date), i(2, 'tags') }
    )
  ),
})

ls.add_snippets('lua', {
  s('req', fmt("local {} = require('{}')", { i(1, 'default'), rep(1) })),
})
ls.add_snippets('python', {
  s(
    'ifmain',
    fmt(
      [[
          if __name__ == "__main__":
            {}
        ]],
      { i(1, 'main()') }
    )
  ),
  s('fr', fmt('from {} import {}', { i(1), i(2) })),
  s('im', fmt('import {}', { i(1) })),
  s('s', { t 'self' }),
  s(
    { trig = 'def', name = 'define', desc = 'define a function' },
    fmt(
      [[
        def {}({}: {}) -> {}:
          {}
    ]],
      { i(1, 'fn'), i(2, 'arg'), i(3, 'type'), i(4, 'None'), i(5, 'pass') }
    )
  ),
  s('on', { t '| None' }),
  s('pmp', fmt([[ @pytest.mark.parametrize("{}", [{}]) ]], { i(1, 'x'), i(2, '1') })),
  s('tv', fmt([[ {} = TypeVar("{}") ]], { i(1, 'T'), rep(1) })),
  s('nt', fmt([[ {} = NewType("{}") ]], { i(1, 'T'), rep(1) })),
  s('Im', { t 'Image.Image' }),
  -- s("mod", fmt(
  --     [[
  --       _task_core: "{}"

  --       @model_validator(mode="after")
  --       def init_task_core(self) -> Self:
  --           self._task_core = {}(infer_from=self.infer_from)
  --           return self
  --     ]], {i(1, "_Task_Core"), rep(1)} )
  -- ),
  s('tt', fmt('{}.tasks["{}"].gpu_services', { i(1), i(2) })),
  s('ti', { t '# type: ignore' }),
  s('pi', { t '# pyright: ignore' }),
  s('print', fmt([[ print(f"{{{}=}}") ]], { i(1, 'x') })),
})
