"My vimrc configuration
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
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/MatlabFilesEdition'
Plugin 'Valloric/YouCompleteMe'
Plugin 'neomake/neomake'
Plugin 'JamshedVesuna/vim-markdown-preview'
" -------------------------------------- "

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


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

inoremap jk <ESC>
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase

"color gruvbox

" set clipboard=unnamed

nnoremap j gj
nnoremap k gk
let mapleader = ','


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap gb :ls<CR>:b<Space>


set t_Co=256
colorscheme gruvbox


" change cursor shape in different modes
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

autocmd FileType matlab setlocal commentstring=%\ %s

autocmd BufEnter *.m    compiler mlint

let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:python_host_prog='/home/dmalt/anaconda/bin/python'

let vim_markdown_preview_github=1

"Map saving to ctrl+s
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

" let g:neomake_python_flake8_maker = {
"     \ 'exe': 'python2.7',
"     \ 'errorformat': '%A%f: line %l\, col %v\, %m \ (%t%*\d\)',
"     \ }
" let g:neomake_python_enable_makers = ['flake8']

autocmd InsertChange,TextChanged * update | Neomake
