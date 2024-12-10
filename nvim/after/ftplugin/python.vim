setlocal nospell
" echom 'SUCCESS!'
let g:python_highlight_all=1
"set cc=100

" define custom mappings for the python filetype

" nmap <localleader><localleader> 0<Plug>(iron-send-motion)$
" vmap <localleader><localleader> <Plug>(iron-send-motion)
" nnoremap <silent> <LocalLeader>tc :call iron-send-motion()<cr>
" let g:neoterm_repl_python = ['conda activate mne', 'clear', 'ipython --no-autoindent']
" let g:neoterm_repl_python = ['conda activate mne_bids', 'clear', 'ipython --no-autoindent']
" let g:neoterm_repl_python = ['ipython --no-autoindent']
let g:black_linelength=88
" nnoremap <Leader>B :Black<CR>
" let g:ale_linters = {
"             \ 'python': ['flake8', 'mypy'],
"             \}
" let g:ale_python_flake8_options='--ignore E203,W503,E704 --max-line-length 99'
" autocmd BufWritePre *.py :Isort
let g:vim_isort_config_overrides = {
  \ 'include_trailing_comma': 1, 'multi_line_output': 3, 'line_length': 88}
