setlocal nospell
" echom 'SUCCESS!'
let g:python_highlight_all=1
set cc=80

" define custom mappings for the python filetype

" nmap <localleader><localleader> 0<Plug>(iron-send-motion)$
" vmap <localleader><localleader> <Plug>(iron-send-motion)
" nnoremap <silent> <LocalLeader>tc :call iron-send-motion()<cr>
" " neoterm config {{{ "
let g:neoterm_position = 'vertical'
let g:neoterm_automap_keys = '<LocalLeader>t'
let g:neoterm_size=100

" nnoremap <silent> <LocalLeader>ef :TREPLSendFile<cr>
nnoremap <silent> <LocalLeader><LocalLeader> :TREPLSendLine<cr>
vnoremap <silent> <LocalLeader><LocalLeader> :TREPLSendSelection<cr>

" Useful maps
" hide/close terminal
nnoremap <silent> <LocalLeader>h :Tclose<cr>
" clear terminal
nnoremap <silent> <LocalLeader>tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <LocalLeader>tc :call neoterm#kill()<cr>
nnoremap <silent> <LocalLeader>th :T <C-R><C-W>?<CR>

nnoremap <silent> <LocalLeader>o :vertical Topen<cr>

nnoremap <silent> <LocalLeader>tf :TREPLSendFile<cr>
" " }}} neoterm config "
