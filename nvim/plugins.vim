" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' " plugins management
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-unimpaired'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/MatlabFilesEdition'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'vim-scripts/CSApprox'
Plugin 'vim-scripts/mayansmoke'
Plugin 'kassio/neoterm'
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'deoplete-plugins/deoplete-jedi'
Plugin 'ncm2/ncm2'
Plugin 'roxma/nvim-yarp'
Plugin 'ncm2/ncm2-jedi'

Plugin 'nelstrom/vim-visual-star-search'
Plugin 'lervag/vimtex'
Plugin 'machakann/vim-highlightedyank'
Plugin 'dmalt/nvim-cyrillic'
Plugin 'freitass/todo.txt-vim'
Plugin 'tommcdo/vim-exchange'
" ------------- ultisnips -------------- "
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Plugin to make :Gbrowse work
Plugin 'tpope/vim-rhubarb'
Plugin 'godlygeek/tabular'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

Plugin 'roosta/srcery'
Plugin 'vim-python/python-syntax'

Plugin 'w0rp/ale'
" Plugin 'Vigemus/iron.nvim'
Plugin 'kana/vim-textobj-user'
Plugin 'bps/vim-textobj-python'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'Shougo/echodoc.vim'
Plugin 'kana/vim-metarw'
Plugin 'mattn/vim-metarw-gdrive'
Plugin 'mattn/webapi-vim'
Plugin 'liuchengxu/vim-which-key'
Plugin 'python/black'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'mattn/emmet-vim'
Plugin 'kana/vim-textobj-entire'
Plugin 'mtth/scratch.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'haya14busa/is.vim'
Plugin 'haya14busa/vim-asterisk'
" Plugin 'bkad/CamelCaseMotion'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype off
" end of vundle configuration
