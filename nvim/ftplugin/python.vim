setlocal nospell
" echom 'SUCCESS!'
let g:python_highlight_all=1
set cc=100

" define custom mappings for the python filetype

" nmap <localleader><localleader> 0<Plug>(iron-send-motion)$
" vmap <localleader><localleader> <Plug>(iron-send-motion)
" nnoremap <silent> <LocalLeader>tc :call iron-send-motion()<cr>
" " neoterm config {{{ "
" let g:neoterm_position = 'vertical'
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = '<LocalLeader>t'
let g:neoterm_size=10
" let g:neoterm_repl_python = ['conda activate mne', 'clear', 'ipython --no-autoindent']
let g:neoterm_repl_python = ['conda activate mne_bids', 'clear', 'ipython --no-autoindent']
" let g:neoterm_repl_python = ['ipython --no-autoindent']
let g:neoterm_direct_open_repl = 0
let g:neoterm_eof = "\r"

" " }}} neoterm config "

" black {{{ "
let g:black_linelength=99
nnoremap <localleader>B :Black<CR>
" }}} black "
" linting {{{ "
let g:ale_linters = {
            \ 'python': ['flake8', 'mypy'],
            \}
let g:ale_python_flake8_options='--ignore E203,W503 --max-line-length 99'
" }}} linting "
" sort python imports {{{ "
autocmd BufWritePre *.py :Isort
let g:vim_isort_config_overrides = {
  \ 'include_trailing_comma': 1, 'multi_line_output': 3}
" }}} sort python imports "
