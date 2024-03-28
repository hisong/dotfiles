set encoding=utf-8
scriptencoding utf-8

" display {{{
set lines=30
set columns=90
set showtabline=2
set guioptions=gLt
set guicursor=a:blinkon0
set visualbell t_vb=
colorscheme wombat
" }}}

" font {{{
if has('win32') || has('win64')
    set guifont=HackGen:h14
    set renderoptions=type:directx,renmode:5
else
    set guifont=Ricty\ Diminished\ Discord\ 10
endif
" }}}

" ambiguous {{{
" □とか○の文字があってもカーソル位置がずれないようにする
" guifont設定によりautoへリセットされるため追加
if exists('&ambiwidth')
    set ambiwidth=double
endif
" }}}

" My Functions {{{
function! FontSizeChange(fontsize)
    let fontlist = split(&guifont, 'h')
    call add(fontlist, remove(fontlist, -1) + a:fontsize)
    let newfontlist = join(fontlist, 'h')
    execute('set guifont=' . newfontlist)
endfunction
" }}}

" vim: foldmethod=marker
