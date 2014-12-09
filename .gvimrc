scriptencoding utf-8

" colorscheme {{{
" gvim起動時のみcolorschemeを遅延ロード
NeoBundleSource vim-hybrid
"NeoBundleSource vim-colors-solarized
" }}}

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
let g:hybrid_use_Xresources = 1
colorscheme hybrid
"set background=light
"colorscheme solarized
" }}}

" font {{{
set guifont=Ricty\ Discord\ 10
set guifontwide=Ricty\ Discord\ 10
" }}}

" vim: foldmethod=marker
