
set cc=80

" " neoterm config {{{ "
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = '<LocalLeader>t'
let g:neoterm_size=10

" nnoremap <silent> <LocalLeader>ef :TREPLSendFile<cr>
nnoremap <silent> <LocalLeader><LocalLeader> :TREPLSendLine<cr>
vnoremap <silent> <LocalLeader>t :TREPLSendSelection<cr>

" Useful maps
" hide/close terminal
nnoremap <silent> <LocalLeader>h :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> <LocalLeader>tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <LocalLeader>tc :call neoterm#kill()<cr>

nnoremap <silent> <LocalLeader>o :Topen<cr>
" " }}} neoterm config "
