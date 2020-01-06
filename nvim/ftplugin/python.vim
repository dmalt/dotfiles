setlocal nospell
" echom 'SUCCESS!'
let g:python_highlight_all=1
set cc=80

" define custom mappings for the python filetype

nmap <localleader><localleader> 0<Plug>(iron-send-motion)$
vmap <localleader><localleader> <Plug>(iron-send-motion)
" nnoremap <silent> <LocalLeader>tc :call iron-send-motion()<cr>
