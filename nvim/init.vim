"My vimrc configuration
" echom ":)"
set nocompatible              " required
filetype off                  " required


source $HOME/.dotfiles/nvim/plugins.vim  " load plugins


" basic configuration {{{"

" set configuration variables {{{ "
filetype indent on

" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
" set expandtab

" set encoding=utf-8
" set scrolloff=5
" set cursorline
" set autoindent
" set showmode
" set showcmd
" set hidden
" set wildmenu
" set wildmode=list:longest
" set visualbell
" set ttyfast
" set ruler
" set backspace=indent,eol,start
" set laststatus=2
" set number
" set relativenumber
" set undofile
" set background=dark
" set smartcase
" set clipboard=unnamed,unnamedplus
" set list listchars=tab:>-,eol:¶
" set splitbelow
" set splitright
" set foldmethod=marker  " setup folding
" syntax on  " vim doesn't turn syntax on by default compared to neovim
:lua require("settings")
" }}} set configuration variables "

" set mappings {{{ "

:lua require("mappings")
:lua require("plugins")
" :lua require("lualine").setup()
" nnoremap / /\v
" vnoremap / /\v

" nnoremap j gj
" nnoremap k gk

" let mapleader = "\<space>"
" let maplocalleader = ','
" let maplocalleader = "\<space>"

" space-j/k deletes blank line below/above, and Alt-j/k inserts.
" nnoremap <silent><LocalLeader>J m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
" nnoremap <silent><LocalLeader>K m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
" nnoremap <silent><LocalLeader>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
" nnoremap <silent><LocalLeader>k :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Mappings to open and source vimrc
" nnoremap <Leader>ev :edit $MYVIMRC<cr>
" nnoremap <Leader>ep :edit $HOME/.dotfiles/nvim/plugins.vim<cr>
" nnoremap <Leader>sv :source $MYVIMRC<cr>

" inoremap <c-d> <Del>
" inoremap <c-h> <BS>
" nnoremap gp `[v`] " select last paste

" nnoremap <localleader>; :
" nnoremap <localleader>q; q:

" move to next line everything after enter
" nnoremap <cr> a<cr><esc>
"
" Ctrl-l moves cursor right in insert mode
" inoremap <C-l> <C-G>U<Right>

" map saving to ctrl+s
" :nmap <c-s> :w<CR>
" :imap <c-s> <Esc>:w<CR>a
" }}} set mappings "

" abbreviations {{{ "
iabbrev Argumnet Argument
iabbrev argumnet argument
iabbrev sefl self
" }}} abbreviations "

" spelling settings
" setlocal spell spelllang=ru_yo,en_us
" setlocal spell spelllang=ru_ru,en_us
" syntax spell toplevel
" set nospell

" split navigations {{{ "
" if has('nvim')
"     tnoremap <M-h> <C-\><C-N><C-w>h
"     tnoremap <M-j> <C-\><C-N><C-w>j
"     tnoremap <M-k> <C-\><C-N><C-w>k
"     tnoremap <M-l> <C-\><C-N><C-w>l
"     tnoremap <M-q> <C-\><C-N><C-w>q
" endif
" inoremap <M-h> <C-\><C-N><C-w>h
" inoremap <M-j> <C-\><C-N><C-w>j
" inoremap <M-k> <C-\><C-N><C-w>k
" inoremap <M-l> <C-\><C-N><C-w>l
" inoremap <M-q> <C-\><C-N><C-w>q
" nnoremap <M-h> <C-w>h
" nnoremap <M-j> <C-w>j
" nnoremap <M-k> <C-w>k
" nnoremap <M-l> <C-w>l
" nnoremap <M-q> <C-w>q
" nnoremap <Tab> <C-w><C-w>
nnoremap <M-Tab> <C-w>W

nnoremap <Up> <C-W>+
nnoremap <silent> <Down> <C-W>-
nnoremap <Right> <C-W>>
nnoremap <Left> <C-W><
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif
" }}} splilt navigations "


" }}} basic configuration "
" colors {{{ "
" set t_Co=256
" set termguicolors
" set t_Co=16
" colorscheme gruvbox
colorscheme solarized8_low
" colorscheme afterglow
" colorscheme OceanicNext
" colorscheme space-vim-dark
" colorscheme srcery
" colorscheme archery
" colorscheme seoul256
" colorscheme solarized8_low
" colorscheme anderson
" Python3Syntax
" colorscheme afterglow
" colorscheme dracula
" colorscheme dracula
" colorscheme Tomorrow-Night
" colorscheme base16-tomorrow-night
" let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
" }}} colors "
" airline setup {{{ "
" let g:airline_powerline_fonts = 1
" let g:airline_theme='bubblegum'
" let g:airline_theme='luna'
" }}} airline setup "
" python host prog {{{ "
" let g:python_host_prog='/usr/bin/python2'
" let g:python_host_prog='/usr/bin/python2'
" let g:python3_host_prog='/usr/bin/python'
" let g:python3_host_prog='/home/dmalt/anaconda3/bin/python'
" }}} python host prog "
" fugitive {{{ "
" set diffopt+=vertical
" }}} fugitive "
" " {{{arduino "
" " my_file.ino [arduino:avr:uno]
" function! MyStatusLine()
"   return '%f [' . g:arduino_board . ']'
" endfunction
" setl statusline=%!MyStatusLine()

" let g:arduino_cmd='/usr/bin/arduino'
" let g:arduino_dir='/usr/share/arduino'
" let g:arduino_board='archlinux-arduino:avr:uno'
" let g:arduino_programmer = 'archlinux-arduino:usbtinyisp'
" let g:arduino_args = '--verbose-upload'
" let g:arduino_serial_baud = 9600
" let g:arduino_serial_port = '/dev/ttyACM0'
" let g:arduino_auto_baud = 1
" nnoremap <leader>u :ArduinoUpload<CR>
" " arduino}}} "
" todo.txt hotkeys {{{ "
" config todo hotkeys
" nnoremap <localLeader>et :edit ~/Documents/Dropbox/Apps/Simpletask/todo.txt<cr> :lcd ~/Documents/Dropbox/Apps/Simpletask<cr>
" nnoremap <localLeader>ei :edit ~/Documents/Dropbox/Apps/Simpletask/inbox.txt<cr> :lcd ~/Documents/Dropbox/Apps/Simpletask<cr>
" }}} todo.txt hotkeys "
" setup ultisnips {{{ "
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir="~/.dotfiles/nvim/mySnippets/UltiSnips"
set runtimepath+=$HOME/.dotfiles/nvim/mySnippets
" }}} setup ultisnips "
" fzf {{{ "
" set rtp+=~/.fzf
" let g:ackprg = "ag --vimgrep"
" " This is the default extra key bindings
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10split enew' }

" if has("nvim")
"     nnoremap <Leader>b :Telescope buffers<CR>
"     nnoremap <Leader>/ :Telescope find_files<CR>
" else
"     nnoremap <Leader>b :Buffers<CR>
"     nnoremap <Leader>/ :Files<CR>
" endif

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
"   \   fzf#vim#with_preview(), <bang>0)
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
" let g:fzf_history_dir = '~/.local/share/fzf-history'
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
" }}} fzf "
" terminal buffer colors {{{ "
let g:terminal_color_0 = '#3f3f3f'
let g:terminal_color_1 = '#705050'
let g:terminal_color_2 = '#60b48a'
let g:terminal_color_3 = '#dfaf8f'
let g:terminal_color_4 = '#506070'
let g:terminal_color_5 = '#dc8cc3'
let g:terminal_color_6 = '#8cd0d3'
let g:terminal_color_7 = '#dcdccc'
let g:terminal_color_8 = '#709080'
let g:terminal_color_9 = '#dca3a3'
let g:terminal_color_10 = '#c3bf9f'
let g:terminal_color_11 = '#f0dfaf'
let g:terminal_color_12 = '#94bff3'
let g:terminal_color_13 = '#ec93d3'
let g:terminal_color_14 = '#93e0e3'
let g:terminal_color_15 = '#ffffff'
" }}} terminal buffer colors "
" vim-which-key configuration {{{ "
" nnoremap <silent><localleader> :WhichKey '<Space>'<CR>
" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> g      :<c-u>WhichKey 'g'<CR>

" nnoremap <silent> <C-W>      :<c-u>WhichKey '<C-W>'<CR>
set timeoutlen=500

" let g:which_key_map = {}
" let g:which_key_map.w = {
"       \ 'name' : '+windows' ,
"       \ 'w' : ['<C-W>w'     , 'other-window']          ,
"       \ 'd' : ['<C-W>c'     , 'delete-window']         ,
"       \ '-' : ['<C-W>s'     , 'split-window-below']    ,
"       \ '|' : ['<C-W>v'     , 'split-window-right']    ,
"       \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
"       \ 'h' : ['<C-W>h'     , 'window-left']           ,
"       \ 'j' : ['<C-W>j'     , 'window-below']          ,
"       \ 'l' : ['<C-W>l'     , 'window-right']          ,
"       \ 'k' : ['<C-W>k'     , 'window-up']             ,
"       \ 'J' : ['<C-W>J'     , 'move-window-down']      ,
"       \ 'H' : ['<C-W>H'     , 'move-window-left']      ,
"       \ 'K' : ['<C-W>K'     , 'move-window-up']        ,
"       \ 'L' : ['<C-W>L>'    , 'move-window-right']     ,
"       \ '=' : ['<C-W>='     , 'balance-window']        ,
"       \ 's' : ['<C-W>s'     , 'split-window-below']    ,
"       \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
"       \ }

" let g:which_key_map.m = {
"       \ 'name' : '+markdown-preview' ,
"       \ 'p' : ['MarkdownPreviewToggle', 'toggle']
"       \ }
" nnoremap <silent><localleader>to :terminal<CR>i

" let g:which_key_map.g = {
"             \ 'name' : '+git',
"             \ 'w'    : ['Gwrite', 'git-write'],
"             \ 'r'    : ['Gread', 'git-read'],
"             \ 's'    : ['Git', 'git-status'],
"             \ 'd'    : ['Gdiff', 'git-diff'],
"             \ 'c'    : [":Git commit", 'git-commit'],
"             \}


" if has('nvim')
"     let g:which_key_map.n = {
"         \ 'name' : '+nerd-tree',
"         \ 'o' : [':NvimTreeOpen', 'open'],
"         \ 'f' : [':NvimTreeFindFile', 'find'],
"         \}
" endif

" if has('nvim')
"     let g:which_key_map.f = {
"           \ 'name' : '+find',
"           \ 'f'    : [':Telescope find_files', 'files'],
"           \ 'b'    : [':Telescope buffers', 'buffers'],
"           \ 'l'    : [':Telescope live_grep', 'lines'],
"           \ 'g'    : [':Telescope git_files', 'git-files'],
"           \ 'h'    : [':Telescope help_tags', 'help-tags'],
"           \ 'o'    : [':Telescope oldfiles', 'old-files'],
"           \ }
" else
"     let g:which_key_map.f = {
"           \ 'name' : '+find',
"           \ 'f'    : ['Files', 'files'],
"           \ 'b'    : ['Buffers', 'buffers'],
"           \ 'l'    : ['Ag', 'lines'],
"           \ 'g'    : ['GitFiles', 'git-files'],
"           \ }
" endif

" call which_key#register('<Space>', "g:which_key_map")
" nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
" vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
" }}} vim-which-key configuration "
" ncm2 settings {{{ "
" if has('nvim')
"     " enable ncm2 for all buffers
"     autocmd BufEnter * call ncm2#enable_for_buffer()

"     " IMPORTANT: :help Ncm2PopupOpen for more information
"     set completeopt=noinsert,menuone,noselect,preview
" endif
" }}} ncm2 settings "
" scratch buffer {{{ "
let g:scratch_filetype = 'python'
let g:scratch_top = 0
let g:scratch_height = 10
" let g:scratch_horizontal = 0
let g:scratch_persistence_file = '/tmp/scratch.vim'
if has('nvim')
    tnoremap <M-s> <C-\><C-N>:Scratch<cr>:set filetype=python<cr>
endif
nnoremap <M-s> :Scratch<cr>:set filetype=python<cr>
inoremap <M-s> <C-\><C-N>:Scratch<cr>:set filetype=python<cr>
" }}} scratch buffer "
" asterisk mappings {{{ "
map *   <Plug>(asterisk-z*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)
let g:asterisk#keeppos = 1
" }}} asterisk mappings "
" vim-markdown-preview {{{ "
let vim_markdown_preview_github=1
" }}} vim-markdown-preview "
" automatically remove trailing whitespaces {{{ "
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre *.py,*.js,*.tex,*.m,*.sh,*.md,*.rst :call <SID>StripTrailingWhitespaces()

" }}} automatically remove trailing whitespaces "
" Execute local vimrc settings
" neoterm configuration {{{ "
" nnoremap <silent> <LocalLeader>ef :TREPLSendFile<cr>
nnoremap <silent> <LocalLeader><LocalLeader> :TREPLSendLine<cr>
vnoremap <silent> <LocalLeader><LocalLeader> :TREPLSendSelection<cr>
let g:neoterm_automap_keys="<LocalLeader>tt"

" Useful maps
" hide/close terminal
nnoremap <silent> <Leader>h :Tclose<cr>
" clear terminal
nnoremap <silent> <Leader>tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <Leader>tc :call neoterm#kill()<cr>
nnoremap <silent> <Leader>th :T <C-R><C-W>?<CR>

nnoremap <silent> <Leader>o :below Topen<cr>

nnoremap <silent> <Leader>tf :TREPLSendFile<cr>
" }}} neoterm configuration "
lua << EOF
require("nvim-lsp-installer").setup {}
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
require'nvim-tree'.setup {
    view = {width=50}
    }
EOF

set completeopt=menu,menuone,noselect,preview

" let g:pylsp.plugins.flake8.maxLineLength=99

lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<localleader>d', vim.diagnostic.open_float, opts)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
EOF

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      [',n'] = cmp.mapping.complete(),
      [',e'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

    local on_attach = function(client, bufnr)
      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    end
  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
  require('lspconfig')['yamlls'].setup {}

local signs = { Error = " ", Warn = " ", Info = " ", Hint = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({
  update_in_insert = false,
  virtual_text = {source = true, severity = {min = vim.diagnostic.severity.INFO}},
  signs = true,
})
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python", "dockerfile", "vim" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,


  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = {'vim'},
  },
}
EOF

function OpenMarkdownPreview (url)
    execute "silent ! google-chrome --new-window " . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'

command! ScratchCustom lua require'tools'.makeScratch()

let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

