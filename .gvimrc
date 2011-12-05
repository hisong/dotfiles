" ------------------------------
" display " {{{
set lines=40
if has('win32')
  set columns=128
elseif has('gui_macvim')
  set columns=120
endif
set showtabline=2
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guicursor=a:blinkon0
set visualbell t_vb=
"colorscheme solarized
"colorscheme molokai
colorscheme desert
"colorscheme darkdevel
"colorscheme Zenburn
" }}}

" ------------------------------
" font " {{{
if has('win32')
  set guifont=MeiryoKe_Gothic:h10
elseif has('xfontset')
  set guifontset=a14,r14,k14
endif
if has('printer')
  if has('win32')
    set printfont=MeiryoKe_Gothic:h10
  endif
endif
" }}}

" vim: foldmethod=marker
