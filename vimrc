"My vimrc configuration
" echom ":)"
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" ----------- Install plugins ------- "
Plugin 'gmarik/Vundle.vim'
" Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-unimpaired'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/MatlabFilesEdition'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'neomake/neomake'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'vim-scripts/CSApprox'
Plugin 'kassio/neoterm'
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-jedi'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'lervag/vimtex'
Plugin 'ervandew/supertab'
Plugin 'machakann/vim-highlightedyank'
Plugin 'sudar/vim-arduino-syntax'
Plugin 'sudar/vim-arduino-snippets'
Plugin 'stevearc/vim-arduino'
Plugin 'rhysd/vim-grammarous'
Plugin 'Shougo/unite.vim'
Plugin 'reedes/vim-wordy'
Plugin 'tell-k/vim-autopep8'
" Plugin 'Rykka/riv.vim'
" Plugin 'Rykka/InstantRst'
Plugin 'vim-scripts/vim-punto-switcher'
Plugin 'dmalt/nvim-cyrillic'
Plugin 'junegunn/goyo.vim'
Plugin 'freitass/todo.txt-vim'

" -------------------------------------- "

" ------------- ultisnips -------------- "
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ------------- ultisnips -------------- "


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype off

"call pathogen#infect()
" end of vundle configuration

filetype indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
"set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

set number
set relativenumber

set undofile
set background=dark
set list listchars=tab:>-,eol:¶

" inoremap jk <ESC>
" inoremap <C-p> <ESC>
" nnoremap / /\v
" vnoremap / /\v
set ignorecase
set smartcase

"color gruvbox

set clipboard=unnamed

nnoremap j gj
nnoremap k gk
let mapleader = ','
let maplocalleader = "\<space>"
noremap \ ,


"split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <Esc> <C-\><C-n>

" -------------- neoterm config ---------- "
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = ',tt'
let g:neoterm_size=10

nnoremap <silent> ,ef :TREPLSendFile<cr>
nnoremap <silent> ,el :TREPLSendLine<cr>
vnoremap <silent> ,es :TREPLSendSelection<cr>

" Useful maps
" hide/close terminal
nnoremap <silent> ,h :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>

nnoremap <silent> ,o :Topen<cr>

" ------------------------------------------------ "

" ---------- deoplete ----------- "
" call deoplete#enable()
" deoplete tab-complete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" ------------------------------- "

nnoremap gb :ls<CR>:b<Space>
" nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

set t_Co=256
colorscheme gruvbox
" colorscheme afterglow
" colorscheme dracula
" colorscheme dracula
" colorscheme Tomorrow-Night
" colorscheme Tomorrow
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }


" change cursor shape in different modes
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

autocmd FileType matlab setlocal commentstring=%\ %s

autocmd BufEnter *.m    compiler mlint

let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'
" let g:python3_host_prog='/home/dmalt/anaconda3/bin/python'

let vim_markdown_preview_github=1

"Map saving to ctrl+s
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

let g:neomake_python_pylint_maker = {
  \ 'args': [
  \ '-d', 'W0613, R0913, C0103',
  \ '-f', 'text',
  \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"',
  \ '-r', 'n'
  \ ],
  \ 'errorformat':
  \ '%A%f:%l:%c:%t: %m,' .
  \ '%A%f:%l: %m,' .
  \ '%A%f:(%l): %m,' .
  \ '%-Z%p^%.%#,' .
  \ '%-G%.%#',
  \ }

let g:neomake_python_flake8_maker = {
    \ 'exe': 'python2.7',
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \ (%t%*\d\)',
    \ }
let g:neomake_python_enabled_makers = ['pylint', 'pycodestyle']

" autocmd InsertChange,TextChanged * update | Neomake
autocmd BufWritePost,BufEnter * Neomake
" Execute local vimrc settings
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

" Define matlab linter mlint
let g:neomake_matlab_mlint_maker = {
            \ 'exe': 'mlint',
            \ 'args': ['-id'],
            \ 'mapexpr': "neomake_bufname.':'.v:val",
            \ 'errorformat':
            \ '%f:L %l (C %c): %m,' .
            \ '%f:L %l (C %c-%*[0-9]): %m,',
            \ }
" This was supposed to print W and E in gutter but doesn't work for now
" let g:neomake_warning_sign = {
"   \ 'text': 'W',
"   \ 'texthl': 'WarningMsg',
"   \ }

" let g:neomake_error_sign = {
"   \ 'text': 'E',
"   \ 'texthl': 'ErrorMsg',
"   \ }

" let g:neomake_message_sign = {
"       \   'text': '➤',
"       \   'texthl': 'NeomakeMessageSign',
"       \ }

let g:neomake_matlab_enabled_makers = ['mlint']
let g:neomake_logfile='/tmp/error.log'

" let g:neomake_open_list = 2

" Setup fugitive
set diffopt+=vertical




" focus on split right away "
set splitbelow
set splitright
" ------------------------- "

" map latex commands from cyrillic {{{latex_cyr "
" latex_cyr}}} "

set inccommand=nosplit " don't open split window for interactive search
set foldmethod=marker  " setup folding



" setup arduino {{{arduino "
" my_file.ino [arduino:avr:uno]
function! MyStatusLine()
  return '%f [' . g:arduino_board . ']'
endfunction
setl statusline=%!MyStatusLine()

let g:arduino_cmd='/usr/bin/arduino'
let g:arduino_dir='/usr/share/arduino'
let g:arduino_board='archlinux-arduino:avr:uno'
let g:arduino_programmer = 'archlinux-arduino:usbtinyisp'
let g:arduino_args = '--verbose-upload'
let g:arduino_serial_baud = 9600
let g:arduino_serial_port = '/dev/ttyACM0'
let g:arduino_auto_baud = 1
nnoremap <leader>u :ArduinoUpload<CR>
" arduino}}} "

" Mappings to open and source vimrc
nnoremap <LocalLeader>ev :vsplit $MYVIMRC<cr>
nnoremap <LocalLeader>sv :source $MYVIMRC<cr>

nnoremap <cr> a<cr><esc>
nnoremap <Up> <C-W>+
nnoremap <silent> <Down> <C-W>-
nnoremap <Right> <C-W>>
nnoremap <Left> <C-W><
" let g:pswitcher_no_default_key_mappings = 1

" iunmap <c-k>
" imap <c-k> <esc>mma<c-^><Plug>(pswitcher-input-word)<esc>`ma


" inoremap <c-k> <esc>mma<c-o>:exec MapLayout(@a)<CR><esc>`m"bp

" config todo hotkeys
nnoremap <localLeader>et : vsplit ~/Documents/Dropbox/Apps/Simpletask/todo.txt<cr> :lcd ~/Documents/Dropbox/Apps/Simpletask<cr>
