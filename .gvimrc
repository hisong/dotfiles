scriptencoding utf-8

" ------------------------------
" colorscheme " {{{
NeoBundleSource vim-colors-solarized
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
set background=light
"set background=dark
colorscheme solarized
" }}}

" ------------------------------
" font " {{{
if has('win32')
    set guifont=Ricty Discord:h10
    " おそらくWindowsでしか印刷は使わない
    set printfont=Ricty Discord:h10
else
    set guifont=Ricty Discord:h14
endif
" }}}

" vim: foldmethod=marker
