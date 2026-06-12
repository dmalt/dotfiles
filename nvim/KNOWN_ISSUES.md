# Known Issues

## Treesitter crash on LSP hover (Neovim 0.12.0)

**Status:** Unfixed. Workaround applied manually (deleted query files).

**Symptoms:** Error when pressing `K` in Python (or any LSP hover that renders markdown):
```
Decoration provider "start" (ns=nvim.treesitter.highlighter):
Lua: ...nvim/runtime/lua/vim/treesitter/languagetree.lua:215:
  .../nvim/runtime/lua/vim/treesitter.lua:196: attempt to call method 'range' (a nil value)
```

**Root cause:** nvim-treesitter's markdown injection query
(`queries/markdown/injections.scm`) uses a custom directive
`#set-lang-from-info-string!` that nvim-treesitter registers itself.
Neovim 0.12 now calls `vim.treesitter.start()` internally for hover
float windows. In that context the custom directive isn't available,
so the treesitter highlighter crashes on a nil node.

The bundled Neovim 0.12 query uses standard `@injection.language` instead,
which works fine.

**Workaround:** Delete nvim-treesitter's markdown query directories so
the bundled queries are used:
```bash
rm -r ~/.local/share/nvim/lazy/nvim-treesitter/queries/markdown
rm -r ~/.local/share/nvim/lazy/nvim-treesitter/queries/markdown_inline
```

This needs to be redone after every nvim-treesitter update. A startup
hook in `treesitter.lua` config could automate this:
```lua
local ts_queries = vim.fn.stdpath('data') .. '/lazy/nvim-treesitter/queries/'
for _, lang in ipairs { 'markdown', 'markdown_inline' } do
  vim.fn.delete(ts_queries .. lang, 'rf')
end
```

**Upstream:** Not yet reported on nvim-treesitter. Should be filed at
https://github.com/nvim-treesitter/nvim-treesitter/issues

**Date:** 2026-04-02 (Neovim 0.12.0 released 2026-03-29)
