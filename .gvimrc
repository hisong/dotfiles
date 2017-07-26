set encoding=utf-8
scriptencoding utf-8

" display {{{
set lines=48
set columns=138
set showtabline=2
set guioptions-=e
set guioptions-=m
set guioptions-=r
set guioptions-=T
set guicursor=a:blinkon0
set visualbell t_vb=
"colorscheme Tomorrow-Night-Bright
"let g:hybrid_use_Xresources = 1
"colorscheme hybrid
"set background=dark
set background=light
colorscheme solarized
"colorscheme inkpot
" }}}

" font {{{
if has('win32') || has('win64')
    set guifont=MeiryoKe_Gothic:h10
    set guifontwide=MeiryoKe_Gothic:h10
else
    set guifont=Ricty\ Discord\ 10
    set guifontwide=Ricty\ Discord\ 10
endif
" }}}

" vim: foldmethod=marker
