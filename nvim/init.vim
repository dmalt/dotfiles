"My vimrc configuration
" echom ":)"
set nocompatible              " required
filetype off                  " required


source $HOME/.dotfiles/nvim/plugins.vim  " load plugins

" basic configuration {{{"

" set configuration variables {{{ "
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

" set ignorecase
set smartcase
set clipboard=unnamed,unnamedplus

" focus on split right away "
set splitbelow
set splitright

if has('nvim')
    set inccommand=nosplit " don't open split window for interactive search
endif
set foldmethod=marker  " setup folding

syntax on  " vim doesn't turn syntax on by default compared to neovim
" }}} set configuration variables "

" set mappings {{{ "
nnoremap / /\v
vnoremap / /\v

nnoremap j gj
nnoremap k gk

let mapleader = "\<space>"
" let mapleader = ','
let maplocalleader = "\<space>"

" space-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><LocalLeader>J m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><LocalLeader>K m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><LocalLeader>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><LocalLeader>k :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Mappings to open and source vimrc
nnoremap <LocalLeader>ev :edit $MYVIMRC<cr>
nnoremap <LocalLeader>ep :edit $HOME/.dotfiles/nvim/plugins.vim<cr>
nnoremap <LocalLeader>sv :source $MYVIMRC<cr>

inoremap <c-d> <Del>
inoremap <c-h> <BS>
nnoremap gp `[v`] " select last paste

nnoremap <localleader>; :
nnoremap <localleader>q; q:

nnoremap <cr> a<cr><esc>  " move to next line everything after enter

inoremap <C-l> <C-G>U<Right> " Ctrl-l moves cursor right in insert mode

" map saving to ctrl+s
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
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
set nospell

" split navigations {{{ "
tnoremap <M-h> <C-\><C-N><C-w>h
tnoremap <M-j> <C-\><C-N><C-w>j
tnoremap <M-k> <C-\><C-N><C-w>k
tnoremap <M-l> <C-\><C-N><C-w>l
tnoremap <M-q> <C-\><C-N><C-w>q
inoremap <M-h> <C-\><C-N><C-w>h
inoremap <M-j> <C-\><C-N><C-w>j
inoremap <M-k> <C-\><C-N><C-w>k
inoremap <M-l> <C-\><C-N><C-w>l
inoremap <M-q> <C-\><C-N><C-w>q
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-q> <C-w>q
" nnoremap <Tab> <C-w><C-w>
nnoremap <M-Tab> <C-w>W

nnoremap <Up> <C-W>+
nnoremap <silent> <Down> <C-W>-
nnoremap <Right> <C-W>>
nnoremap <Left> <C-W><
tnoremap <Esc> <C-\><C-n>
" }}} splilt navigations "


" }}} basic configuration "
" colors {{{ "
set t_Co=256
set termguicolors
" set t_Co=16
" colorscheme gruvbox
" colorscheme solarized8
" colorscheme afterglow
" colorscheme OceanicNext
" colorscheme space-vim-dark
" colorscheme srcery
colorscheme archery
" colorscheme seoul256
" colorscheme solarized8_low
" colorscheme anderson
" Python3Syntax
" colorscheme afterglow
" colorscheme dracula
" colorscheme dracula
" colorscheme Tomorrow-Night
" colorscheme base16-tomorrow-night
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
" }}} colors "
" airline setup {{{ "
let g:airline_powerline_fonts = 1
" let g:airline_theme='bubblegum'
let g:airline_theme='luna'
" }}} airline setup "
" python host prog {{{ "
" let g:python_host_prog='/usr/bin/python2'
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python'
" let g:python3_host_prog='/home/dmalt/anaconda3/bin/python'
" }}} python host prog "
" fugitive {{{ "
set diffopt+=vertical
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
nnoremap <localLeader>et :edit ~/Documents/Dropbox/Apps/Simpletask/todo.txt<cr> :lcd ~/Documents/Dropbox/Apps/Simpletask<cr>
nnoremap <localLeader>ei :edit ~/Documents/Dropbox/Apps/Simpletask/inbox.txt<cr> :lcd ~/Documents/Dropbox/Apps/Simpletask<cr>
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
set rtp+=~/.fzf
let g:ackprg = "ag --vimgrep"
" " This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

nnoremap <LocalLeader>b :Buffers<CR>
nnoremap <LocalLeader>/ :Files<CR>

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

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
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
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> g      :<c-u>WhichKey 'g'<CR>

" nnoremap <silent> <C-W>      :<c-u>WhichKey '<C-W>'<CR>
set timeoutlen=500

let g:which_key_map = {}
let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'J' : ['<C-W>J'     , 'move-window-down']      ,
      \ 'H' : ['<C-W>H'     , 'move-window-left']      ,
      \ 'K' : ['<C-W>K'     , 'move-window-up']        ,
      \ 'L' : ['<C-W>L>'    , 'move-window-right']     ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ }

nnoremap <silent><localleader>to :terminal<CR>i

let g:which_key_map.g = {
            \ 'name' : '+git',
            \ 'w'    : ['Gwrite', 'git-write'],
            \ 'r'    : ['Gread', 'git-read'],
            \ 's'    : ['Gstatus', 'git-status'],
            \ 'd'    : ['Gdiff', 'git-diff'],
            \ 'c'    : [":Git commit", 'git-commit'],
            \}

let g:which_key_map.f = {
      \ 'name' : '+find',
      \ 'f'    : ['Files', 'files'],
      \ 'w'    : ['Windows', 'windows'],
      \ 'b'    : ['Buffers', 'buffers'],
      \ 'l'    : ['Ag', 'lines'],
      \ 'g'    : ['GitFiles', 'git-files'],
      \ }


call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
" }}} vim-which-key configuration "
" ncm2 settings {{{ "
if has('nvim')
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANT: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect
endif
" }}} ncm2 settings "
" scratch buffer {{{ "
let g:scratch_filetype = 'python'
" let g:scratch_top = 0
" let g:scratch_horizontal = 0
let g:scratch_persistence_file = '/tmp/scratch.vim'
nnoremap <localleader>n :Scratch<cr>:set filetype=python<cr>
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

" Execute local vimrc settings
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
