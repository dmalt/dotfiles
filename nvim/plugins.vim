" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call vundle#begin()
" let Vundle manage Vundle, required

Plugin 'gmarik/Vundle.vim'                  " plugins management
" Plugin 'scrooloose/nerdtree'                " nerdtree file browser
" Plugin 'tpope/vim-surround'                 " deal with surrounding brackets, quotes etc.
" Plugin 'tpope/vim-commentary'               " comment with gcc
" Plugin 'tpope/vim-abolish'                  " abbreviation patterns
" Plugin 'tpope/vim-unimpaired'               " hotkey combinations on [, ]
" Plugin 'michaeljsmith/vim-indent-object'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'vim-scripts/MatlabFilesEdition'
" Plugin 'iamcco/markdown-preview.nvim'       " preview markdown on <C-p> depends on xdotool, grip
" Plugin 'tpope/vim-repeat'
" Plugin 'tpope/vim-fugitive'                 " git commands
" Plugin 'tpope/vim-rhubarb'                  " open git files in browser with :Gbrowse
" Plugin 'rafi/awesome-vim-colorschemes'
" Plugin 'vim-scripts/CSApprox'               " colorschemes approximation for terminal
" Plugin 'kassio/neoterm'
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'deoplete-plugins/deoplete-jedi'
if has('nvim')
    " Plugin 'ncm2/ncm2'                          " autocompletion
    " Plugin 'roxma/nvim-yarp'                    " required by ncm2
    " Plugin 'ncm2/ncm2-jedi'                     " python autocompletion
    " Plugin 'ncm2/ncm2-bufword'                  " autocomplete from buffers
    " Plugin 'ncm2/ncm2-path'                     " autocomplete paths
    " Plugin 'nvim-lua/plenary.nvim'
    " Plugin 'nvim-telescope/telescope.nvim'
    " Plugin 'nvim-treesitter/nvim-treesitter'
    " Plugin 'neovim/nvim-lspconfig'
    " Plugin 'williamboman/nvim-lsp-installer'
    Plugin 'hrsh7th/cmp-nvim-lsp'
    Plugin 'hrsh7th/cmp-buffer'
    Plugin 'hrsh7th/cmp-path'
    Plugin 'hrsh7th/cmp-cmdline'
    Plugin 'kyazdani42/nvim-web-devicons' " for file icons
    Plugin 'kyazdani42/nvim-tree.lua'
    Plugin 'hrsh7th/nvim-cmp'
endif
Plugin 'lervag/vimtex'                          " latex plugin
Plugin 'machakann/vim-highlightedyank'
if has('nvim')
    Plugin 'dmalt/nvim-cyrillic'
endif
Plugin 'freitass/todo.txt-vim'
Plugin 'tommcdo/vim-exchange'               " exchange selection with C-x in visual mode
" ------------- ultisnips --------------                             "
Plugin 'SirVer/ultisnips'                   " the engine
Plugin 'honza/vim-snippets'                 " snippets
" --------------------------------------
Plugin 'godlygeek/tabular'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf'                       " fuzzy finder
Plugin 'junegunn/fzf.vim'                   " fzf commands provider
Plugin 'roosta/srcery'                      " colorscheme
" Plugin 'vim-python/python-syntax'
Plugin 'dense-analysis/ale'                 " linting
" Plugin 'Vigemus/iron.nvim'                " REPL
Plugin 'kana/vim-textobj-user'
Plugin 'bps/vim-textobj-python'             " af, if, ac, ic -- around/inside function/class
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'Shougo/echodoc.vim'
Plugin 'kana/vim-metarw'
Plugin 'mattn/vim-metarw-gdrive'
Plugin 'mattn/webapi-vim'
" Plugin 'liuchengxu/vim-which-key'
Plugin 'psf/black'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'mattn/emmet-vim'
Plugin 'kana/vim-textobj-entire'
Plugin 'mtth/scratch.vim'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'haya14busa/is.vim'
Plugin 'haya14busa/vim-asterisk'
Plugin 'yuttie/comfortable-motion.vim'      " nice scroll with C-d, C-u
Plugin 'fisadev/vim-isort'                  " sort python imports with C-i; [dep] /usr/bin/pip install isort

" Plugin 'bkad/CamelCaseMotion'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype off
" end of vundle configuration
