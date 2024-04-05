return {
  'folke/which-key.nvim',
  config = function()
    require('which-key').setup {}
    require('which-key').register {
      ['<leader>'] = {
        f = {
          name = '+find',
          f = { '<cmd>Telescope find_files<cr>', 'Files' },
          h = { '<cmd>Telescope help_tags<cr>', 'Help tags' },
          l = { '<cmd>Telescope live_grep<cr>', 'Lines' },
          r = { '<cmd>Telescope oldfiles<cr>', 'Recent files' },
          b = { '<cmd>Telescope buffers<cr>', 'Buffers' },
        },
        p = {
          name = '+packer',
          u = { '<cmd>PackerUpdate<cr>', 'Update packages' },
          i = { '<cmd>PackerInstall<cr>', 'Install packages' },
          s = { '<cmd>PackerSync<cr>', 'Sync packages' },
          c = { '<cmd>PackerClean<cr>', 'Clean packages' },
          g = { '<cmd>PackerStatus<cr>', 'Get packages status' },
        },
        e = {
          name = '+edit',
          i = { '<cmd>edit $MYVIMRC<cr>', 'Edit init.lua' },
          p = { '<cmd>edit $HOME/.dotfiles/nvim/lua/plugins.lua<cr>', 'Edit plugins' },
          m = { '<cmd>edit $HOME/.dotfiles/nvim/lua/mappings.lua<cr>', 'Edit mappings' },
          s = { '<cmd>edit $HOME/.dotfiles/nvim/lua/settings.lua<cr>', 'Edit settings' },
          t = {
            '<cmd>edit $HOME/.dotfiles/nvim/lua/plugins_config/treesitter_config.lua<cr>',
            'Edit treesitter settings',
          },
          l = { '<cmd>edit $HOME/.dotfiles/nvim/after/plugin/luasnip.lua<cr>', 'Edit Lua snippets' },
        },
        s = {
          name = '+edit',
          i = { '<cmd>source $MYVIMRC<cr>', 'Source init.lua' },
          p = { '<cmd>source $HOME/.dotfiles/nvim/lua/plugins.lua<cr>', 'Source plugins' },
          m = { '<cmd>source $HOME/.dotfiles/nvim/lua/mappings.lua<cr>', 'Source mappings' },
          s = { '<cmd>source $HOME/.dotfiles/nvim/lua/settings.lua<cr>', 'Source settings' },
          t = {
            '<cmd>source $HOME/.dotfiles/nvim/lua/plugins_config/treesitter_config.lua<cr>',
            'Source treesitter settings',
          },
          l = {
            '<cmd>source $HOME/.dotfiles/nvim/after/plugin/luasnip.lua<cr>',
            'Source Lua snippets',
          },
        },
        n = {
          name = '+nvim-tree',
          o = { '<cmd>NvimTreeOpen<cr>', 'Open tree' },
          f = { '<cmd>NvimTreeFindFile<cr>', 'Find current file in tree' },
        },
        t = {
          name = '+terminal',
          f = { '<cmd>ToggleTerm direction=float<cr>', 'Floating terminal' },
          v = { '<cmd>ToggleTerm direction=vertical size=40<cr>', 'Terminal in a vertical split' },
          h = { '<cmd>ToggleTerm direction=horizontal size=10<cr>', 'Terminal in a horizontal split' },
          p = {
            string.format([[<cmd>TermExec cmd='conda activate %s; ipython -i'<cr>]], os.getenv 'CONDA_DEFAULT_ENV'),
            'Open ipython',
          },
        },
        g = {
          name = '+git',
          w = { '<cmd>Gwrite<cr>', 'Add current buffer changes (Gwrite)' },
          r = { '<cmd>Gread<cr>', 'Read the last commited state (Gread)' },
          s = { '<cmd>Git<cr>', 'Git status' },
          d = { '<cmd>Gdiff<cr>', 'Show difference with the last commit' },
          c = { '<cmd>Git commit<cr>', 'Commit changes' },
          a = { '<cmd>Git commit --amend<cr>', 'commit --amend' },
          D = { '<cmd>GDelete<cr>', 'GDelete' },
        },
        r = {
          name = '+ranger',
          a = { '<cmd>RnvimrToggle<cr>', 'Open ranger' },
          r = { '<cmd>RnvimrResize<cr>', 'Resize ranger' },
        },
        o = {
          name = '+obsidian',
          b = { '<cmd>ObsidianBackLinks<cr>', 'Show links to this buffer' },
          d = { '<cmd>ObsidianToday<cr>', 'Create daily note' },
          y = { '<cmd>ObsidianYesterday<cr>', "Open yesterday's note" },
          o = { '<cmd>ObsidianOpen<cr>', 'Open note in Obsidian' },
          n = { '<cmd>ObsidianNew<cr>', 'New note' },
          f = { '<cmd>ObsidianSearch<cr>', 'Find note' },
          q = { '<cmd>ObsidianQuickSwitch<cr>', 'Quick switch' },
          l = { '<cmd>ObsidianLink<cr>', 'Link visual selection to a note' },
          L = { '<cmd>ObsidianLinkNew<cr>', 'Link visual selection to a new note' },
          g = { '<cmd>ObsidianFollowLink<cr>', 'Go to link (follow)' },
          t = { '<cmd>ObsidianTemplate<cr>', 'Insert a template' },
          e = { '<cmd>lua require("nabla").popup()<cr>', 'Equation' },
        },
        u = {
          name = '+undotree',
          t = { '<cmd>UndotreeToggle<CR>', 'Toggle undotree' },
        },
      },
    }
  end,
}
