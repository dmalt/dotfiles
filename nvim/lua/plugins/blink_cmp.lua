return {
  'saghen/blink.cmp',
  -- enabled=false,
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  -- use a release tag to download pre-built binaries
  version = 'v0.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    snippets = { preset = 'luasnip' },
    keymap = {
      preset = 'default',
      ['<C-l>'] = { 'snippet_forward', 'fallback' },
      ['<C-h>'] = { 'snippet_backward', 'fallback' },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, via `opts_extend`
    completion = {
      keyword = { range = 'full' },
    },
    sources = {
      default = { 'lsp', 'snippets', 'path', 'buffer' },
      -- optionally disable cmdline completions
      -- cmdline = {},
      -- providers = {
      --   snippets = {
      --     score_offset = 100, -- Keep snippets prioritized during filtering
      --   },
      -- },
    },

    -- experimental signature help support
    signature = { enabled = true },
  },
  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
  opts_extend = { 'sources.default' },
}
