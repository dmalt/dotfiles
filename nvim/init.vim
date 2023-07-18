"My vimrc configuration
" echom ":)"
" set nocompatible              " required

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


" setlocal spell spelllang=ru_yo,en_us
" setlocal spell spelllang=ru_ru,en_us
" syntax spell toplevel
" set nospell

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
" nnoremap <M-Tab> <C-w>W

" nnoremap <Up> <C-W>+
" nnoremap <silent> <Down> <C-W>-
" nnoremap <Right> <C-W>>
" nnoremap <Left> <C-W><
" if has('nvim')
"     tnoremap <Esc> <C-\><C-n>
" endif


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

let g:tex_flavor = "latex"

"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir="~/.dotfiles/nvim/mySnippets/UltiSnips"
set runtimepath+=$HOME/.dotfiles/nvim/mySnippets


lua require("settings")
lua require("mappings")
lua require("plugins")
lua require("colors")


" nnoremap <silent> <LocalLeader><LocalLeader> :TREPLSendLine<cr>
" vnoremap <silent> <LocalLeader><LocalLeader> :TREPLSendSelection<cr>
" let g:neoterm_automap_keys="<LocalLeader>tt"

" Useful maps
" hide/close terminal
" nnoremap <silent> <Leader>h :Tclose<cr>
" clear terminal
" nnoremap <silent> <Leader>tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
" nnoremap <silent> <Leader>tc :call neoterm#kill()<cr>
" nnoremap <silent> <Leader>th :T <C-R><C-W>?<CR>

" nnoremap <silent> <Leader>o :below Topen<cr>

" nnoremap <silent> <Leader>tf :TREPLSendFile<cr>



" let g:pylsp.plugins.flake8.maxLineLength=99

" autocmd CursorHold * lua vim.diagnostic.open_float()



" lua require("plugins_config/diagnostic_signs")
lua require("plugins_config/treesitter_config")


lua << EOF
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

require('nvim-treesitter.configs').setup {
  playground = { enable = true },
  query_linter = {
    enable = true,
    use_virtual_text = false,
    lint_events = { "BufWrite", "CursorHold" },
  },
  highlight = { enable = true },
}
EOF

nmap <localleader>x <Plug>JupyterExecute

let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

