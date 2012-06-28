scriptencoding utf-8

" ------------------------------
" auGroup " {{{
augroup highlightIdegraphicSpace
    autocmd!
    autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=LightBlue guibg=LightBlue
    autocmd VimEnter,WinEnter * match IdeographicSpace /Å@/
augroup END
" }}}

" ------------------------------
" display " {{{
set lines=50
set columns=160
set showtabline=2
set guioptions-=e
set guioptions-=m
set guioptions-=r
set guioptions-=T
set guicursor=a:blinkon0
set visualbell t_vb=
colorscheme solarized
" }}}

" ------------------------------
" font " {{{
if has('win32')
    set guifont=Ricty:h10
    set printfont=Ricty:h10
else
    set guifont=Ricty:h14
endif
" }}}

" ------------------------------
" tabline " {{{
"set tabline=%!MakeTabLine()
"
"function! s:tabpage_label(n)
"endfunction
"
"function! MakeTabLine()
"    let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
"    let sep = ' | '
"    let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
"    let info = ''
"    return tabpages . '%=' . info
"endfunction
" }}}

" vim: foldmethod=marker
