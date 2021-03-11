"My vimrc configuration
" echom ":)"
set nocompatible              " required
filetype off                  " required


source $HOME/.dotfiles/nvim/plugins.vim  " load plugins

" ultisnips folder configuration {{{ "
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}} ultisnips folder configuration "

" basic configuration {{{ "
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

nnoremap / /\v
vnoremap / /\v

" set ignorecase
set smartcase

set clipboard=unnamed,unnamedplus

nnoremap j gj
nnoremap k gk

" focus on split right away "
set splitbelow
set splitright

set inccommand=nosplit " don't open split window for interactive search
set foldmethod=marker  " setup folding

"


" nnoremap * *``
" set leader {{{ "
let mapleader = "\<space>"
" let mapleader = ','
let maplocalleader = "\<space>"
" }}} set leader "

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
" }}} basic configuration "

nnoremap gp `[v`]  " select last paste

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


" if has('nvim') && executable('nvr')
"     let $VISUAL="nvr -cc split --remote-wait + 'set bufhidden=wipe'"
" endif

" highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15

" deoplete {{{ "
" call deoplete#enable()
" deoplete tab-complete
let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#jedi#ignore_errors = 1
let g:deoplete#sources#jedi#enable_typeinfo = 0
let g:deoplete#sources#jedi#show_docstring = 0
" let g:deoplete#sources#jedi#python_path = "/usr/bin/python3"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" }}} deoplete "

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

autocmd FileType matlab setlocal commentstring=%\ %s

autocmd BufEnter *.m    compiler mlint

" airline setup {{{ "
let g:airline_powerline_fonts = 1
" let g:airline_theme='bubblegum'
let g:airline_theme='luna'
" }}} airline setup "

" python host prog {{{ "
" let g:python_host_prog='/usr/bin/python2'
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'
" let g:python3_host_prog='/home/dmalt/.miniconda3/bin/python'
" }}} python host prog "

" map saving to ctrl+s {{{ "
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
" }}} map saving to ctrl+s "

" linting {{{ "

" let g:neomake_matlab_enabled_makers = ['mlint']
" let g:neomake_logfile='/tmp/error.log'

" let g:neomake_open_list = 2
let g:ale_linters = {
            \ 'python': [ 'flake8'],
            \}
let g:ale_python_flake8_options='--ignore E203,W503'
" }}} linting "

" Setup fugitive
set diffopt+=vertical


" map latex commands from cyrillic {{{latex_cyr "
" latex_cyr}}} "

" " setup arduino {{{arduino "
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

nnoremap <cr> a<cr><esc>

" handle brackets, parents and quotes {{{ "
" inoremap {} {}<C-G>U<Left>
" inoremap () ()<C-G>U<Left>
" inoremap [] []<C-G>U<Left>
" inoremap '' ''<C-G>U<Left>
" inoremap "" ""<C-G>U<Left>
" inoremap <> <><C-G>U<Left>
" inoremap $$ $$<C-G>U<Left>
" inoremap %% %%<C-G>U<Left>
" inoremap <C-l> <C-G>U<Esc>/[)}"'\]>$]<CR>:nohl<CR>a
inoremap <C-l> <C-G>U<Right>
" }}} handle brackets, parents and quotes "

" config todo hotkeys
nnoremap <localLeader>et :edit ~/Documents/Dropbox/Apps/Simpletask/todo.txt<cr> :lcd ~/Documents/Dropbox/Apps/Simpletask<cr>
nnoremap <localLeader>ei :edit ~/Documents/Dropbox/Apps/Simpletask/inbox.txt<cr> :lcd ~/Documents/Dropbox/Apps/Simpletask<cr>

" spelling settings {{{ "
" setlocal spell spelllang=ru_yo,en_us
" setlocal spell spelllang=ru_ru,en_us
" syntax spell toplevel
set nospell
" }}} spelling settings "

" ---------- ctrlp settings ---------- "
" set wildignore+=*.aux,*.bcf,*/.git/*,*.log,*.out,*.toc,*.bbl,*.fls,*.blg,*.pdf,*.gz

" latex settings {{{ "
let g:tex_flavor = "latex"
" vimtex
let g:vimtex_quickfix_autojump = 0 " jump to first error when quickfix opened
let g:vimtex_quickfix_mode = 0 " dont open quickfix automatically

"  trailing whitespaces "
" function! <SID>StripTrailingWhitespaces()
"     " Preparation: save last search, and cursor position.
"     let _s=@/
"     let l = line(".")
"     let c = col(".")
"     " Do the business:
"     %s/\s\+$//e
"     " Clean up: restore previous search history, and cursor position
"     let @/=_s
"     call cursor(l, c)
" endfunction

" autocmd BufWritePre *.py,*.js,*.tex,*.m,*.sh,*.md,*.rst :call <SID>StripTrailingWhitespaces()
" }}} latex settings "

" setup ultisnips {{{ "
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

" goyo {{{ "
function! ProseMode()
    call goyo#execute(0, [114])
    set spell noci nosi noai nolist noshowmode noshowcmd
    set complete+=s
    set bg=light
    if !has('gui_running')
        let g:solarized_termcolors=256
    endif
    colors solarized8_flat
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>
" }}} goyo "

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

" iron mappings {{{ "
" luafile $HOME/.config/nvim/plugins.lua
" let g:iron_map_defaults=0
" nnoremap <silent> <localleader>o :IronRepl<cr><Esc>
" augroup ironmapping
"         autocmd!
"         autocmd Filetype python nmap <buffer> <localleader>t <Plug>(iron-send-motion)
"         autocmd Filetype python nmap <buffer> <localleader>p <Plug>(iron-repeat-cmd)
"         autocmd Filetype python nmap <buffer> <localleader>r :call IronSend(join(["run", expand('%:p')]))<CR>
" augroup END
" augroup ironmapping
"         autocmd!
"         autocmd Filetype matlab nmap <buffer> <localleader>t <Plug>(iron-send-motion)
"         autocmd Filetype matlab nmap <buffer> <localleader>p <Plug>(iron-repeat-cmd)
"         autocmd Filetype matlab nmap <buffer> <localleader>r :call IronSend(join(["run", expand('%:p')]))<CR>
" augroup END

" deactivate default mappings
" let g:iron_map_defaults=0
" }}} iron mappings "


" visual star search {{{ "
" " Name: Star search
" " Author: Name5566 <name5566@gmail.com>
" " Version: 0.1.1

" if exists('loaded_starsearch')
"     finish
" endif
" let loaded_starsearch = 1

" let s:savedCpo = &cpo
" set cpo&vim

" function! s:VStarsearch_searchCWord()
"     let wordStr = expand("<cword>")
"     if strlen(wordStr) == 0
"         echohl ErrorMsg
"         echo 'E348: No string under cursor'
"         echohl NONE
"         return
"     endif

"     if wordStr[0] =~ '\<'
"         let @/ = '\<' . wordStr . '\>'
"     else
"         let @/ = wordStr
"     endif

"     let savedUnnamed = @"
"     let savedS = @s
"     normal! "syiw
"     if wordStr != @s
"         normal! w
"     endif
"     let @s = savedS
"     let @" = savedUnnamed
" endfunction

" " https://github.com/bronson/vim-visual-star-search/
" function! s:VStarsearch_searchVWord()
"     let savedUnnamed = @"
"     let savedS = @s
"     normal! gv"sy
"     let @/ = '\V' . substitute(escape(@s, '\'), '\n', '\\n', 'g')
"     let @s = savedS
"     let @" = savedUnnamed
" endfunction

" nnoremap <silent> * :call <SID>VStarsearch_searchCWord()<CR>:set hls<CR>
" vnoremap <silent> * :<C-u>call <SID>VStarsearch_searchVWord()<CR>:set hls<CR>

" let &cpo = s:savedCpo

" nnoremap <localleader>* :%s/\<<C-r><C-w>\>/<C-r><C-w>/g
" }}} visual star search "

" let g:iron_repl_open_cmd = 'vsplit'
let g:deoplete#sources#jedi#show_docstring = 1


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
"
iabbrev Argumnet Argument
iabbrev argumnet argument
iabbrev sefl self

" vim-easyclip settings {{{ "
"let g:EasyClipUseCutDefaults = 0
"let g:EasyClipAutoFormat = 1
"let g:EasyClipShareYanks = 1
"let g:EasyClipUseSubstituteDefaults = 1

"nmap <localleader>m <Plug>MoveMotionPlug
"xmap <localleader>m <Plug>MoveMotionXPlug
"nmap <localleader>mm <Plug>MoveMotionLinePlug>m m
"nmap <localleader>M <Plug>MoveMotionEndOfLinePlug

"nmap <silent> <localleader>s <plug>SubstituteOverMotionMap
"nmap <localleader>ss <plug>SubstituteLine
"xmap <localleader>s <plug>XEasyClipPaste

"imap <c-v> <plug>EasyClipInsertModePaste
"" swap two characters with vim-exchange since x doesn't yank anymore
"nmap xp cxllcxl

""fix for yankring and neovim
"let g:yankring_clipboard_monitor = 0
" }}} vim-easyclip settings "


" latex thesis mappings {{{ "
" nnoremap <localleader>sm i\mathbf{<ESC>la}<ESC>
" vnoremap <localleader>sm "ac\mathbf{<ESC>"apa}

" nnoremap <localleader>se i\emph{<ESC>la}<ESC>
" vnoremap <localleader>se "ac\emph{<ESC>"apa}
" }}} latex thesis mappings "

" latex thesis abbreviations {{{ "
" iabbrev R_X \mathbf{R}_\mathbf{X}
" iabbrev R_S \mathbf{R}_\mathbf{S}
" iabbrev G \mathbf{G}
" iabbrev I \mathbf{I}
" iabbrev A_k \mathbf{A}_k
" }}} latex thesis abbreviations "

" black {{{ "
let g:black_linelength=79
nnoremap <localleader>B :Black<CR>
" }}} black "

" C mappings handling enter with brackets {{{ "
" adapted from https://stackoverflow.com/questions/6066372/make-vim-curly-braces-square-braces-parens-act-like-textmate
" fun! MyCR()
"     if strpart(getline('.'), col('.') - 2, 2) == '{}'
"         return "\<CR>\<CR>\<Up>\<Tab>"
"     endif
"     return "\<CR>"
" endfun
" autocmd FileType c,cpp,html,java inoremap <CR> <C-R>=MyCR()<CR>
" }}} C mappings "

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" scratch buffer
let g:scratch_filetype = 'python'
" let g:scratch_top = 0
" let g:scratch_horizontal = 0
let g:scratch_persistence_file = '/tmp/scratch.vim'
nnoremap <localleader>n :Scratch<cr>:set filetype=python<cr>

nnoremap <localleader>; :
nnoremap <localleader>q; q:

" autocmd CompleteDone * if !pumvisible() | pclose | endif
" nmap <silent> <buffer> gK <Plug>(kite-docs)
"
" Execute local vimrc settings
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif


" asterisk mappings {{{ "
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)
let g:asterisk#keeppos = 1
" }}} asterisk mappings "

" neoterm configuration {{{ "
" let g:neoterm_repl_python = ['conda activate mne', 'clear', 'ipython --no-autoindent']
let g:neoterm_repl_python = ['conda activate mne_bids_latest', 'clear', 'ipython --no-autoindent']
" let g:neoterm_repl_python = ['ipython --no-autoindent']
let g:neoterm_direct_open_repl = 0
let g:neoterm_eof = "\r"
" }}} neoterm configuration "


" vim-markdown-preview {{{ "
let vim_markdown_preview_github=1
" }}} vim-markdown-preview "

" CamelCaseMotion {{{ "
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge
" omap <silent> iw <Plug>CamelCaseMotion_iw
" xmap <silent> iw <Plug>CamelCaseMotion_iw
" omap <silent> ib <Plug>CamelCaseMotion_ib
" xmap <silent> ib <Plug>CamelCaseMotion_ib
" omap <silent> ie <Plug>CamelCaseMotion_ie
" xmap <silent> ie <Plug>CamelCaseMotion_ie
" imap <silent> <S-Left> <C-o><Plug>CamelCaseMotion_b
" imap <silent> <S-Right> <C-o><Plug>CamelCaseMotion_w
" }}} CamelCaseMotion "
