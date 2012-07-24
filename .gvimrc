scriptencoding utf-8

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
"colorscheme wombat
if g:colors_name ==? 'wombat'
    hi Visual gui=none guifg=khaki guibg=olivedrab
endif
" }}}

" ------------------------------
" font " {{{
if has('win32')
    set guifont=Ricty:h10
    " おそらくWindowsでしか印刷は使わない
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
