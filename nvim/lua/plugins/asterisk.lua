return {
  'haya14busa/vim-asterisk',
  config = function()
    vim.g['asterisk#keeppos'] = 1
    vim.keymap.set({ 'n', 'v', 'o' }, '*', '<Plug>(asterisk-z*)', { noremap = false, desc = 'Star-search for word under cursor' })
    vim.keymap.set({ 'n', 'v', 'o' }, '#', '<Plug>(asterisk-gz*)', { noremap = false })
  end,
}
