scriptencoding utf-8

" ------------------------------
" auGroup " {{{
augroup highlightIdegraphicSpace
    autocmd!
    autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=LightBlue guibg=LightBlue
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
" }}}

" ------------------------------
" display " {{{
set lines=40
if has('win32')
  set columns=128
elseif has('gui_macvim')
  set columns=120
endif
set showtabline=2
set guioptions-=e
set guioptions-=m
set guioptions-=r
set guioptions-=T
set guicursor=a:blinkon0
set visualbell t_vb=
colorscheme solarized
"colorscheme badwolf
"colorscheme aldmeris
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
