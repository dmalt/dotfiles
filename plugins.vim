" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' " plugins management
" Plugin 'flazz/vim-colorschemes'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'scrooloose/nerdcommenter' " 
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
" Plugin 'neomake/neomake'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'vim-scripts/CSApprox'
Plugin 'vim-scripts/mayansmoke'
Plugin 'kassio/neoterm'
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-jedi'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'lervag/vimtex'
" Plugin 'ervandew/supertab'
Plugin 'machakann/vim-highlightedyank'
" Plugin 'sudar/vim-arduino-syntax'
" Plugin 'sudar/vim-arduino-snippets'
" Plugin 'stevearc/vim-arduino'
Plugin 'rhysd/vim-grammarous'  " grammar checker
Plugin 'Shougo/unite.vim'
Plugin 'reedes/vim-wordy'  " spell and style checker
Plugin 'tell-k/vim-autopep8'
" Plugin 'Rykka/riv.vim'
" Plugin 'Rykka/InstantRst'
" Plugin 'vim-scripts/vim-punto-switcher'
Plugin 'dmalt/nvim-cyrillic'
Plugin 'junegunn/goyo.vim'
Plugin 'freitass/todo.txt-vim'
Plugin 'tommcdo/vim-exchange'
" Plugin 'cjrh/vim-conda' 
" Plugin 'bfredl/nvim-ipy'
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

" Plugin 'vim-scripts/guicolorscheme.vim'
Plugin 'roosta/srcery'
" Plugin 'KevinGoodsell/vim-csexact'
" Plugin 'sickill/vim-monokai'
Plugin 'vim-python/python-syntax'

Plugin 'w0rp/ale'
Plugin 'hkupty/iron.nvim'
Plugin 'kana/vim-textobj-user'
Plugin 'bps/vim-textobj-python'
" Plugin 'python-mode/python-mode', { 'branch': 'develop' }
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'fs111/pydoc.vim'
Plugin 'Shougo/echodoc.vim'
Plugin 'kana/vim-metarw'
Plugin 'mattn/vim-metarw-gdrive'
Plugin 'mattn/webapi-vim'
Plugin 'liuchengxu/vim-which-key'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype off
" end of vundle configuration
