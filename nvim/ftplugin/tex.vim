let g:tex_flavor = "latex"
" vimtex
let g:vimtex_quickfix_autojump = 0 " jump to first error when quickfix opened
let g:vimtex_quickfix_mode = 0 " dont open quickfix automatically

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
"
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
