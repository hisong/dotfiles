scriptencoding utf-8
set nocompatible
filetype plugin indent off

" ------------------------------
" NeoBundle " {{{
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif
" }}}

" ------------------------------
" plugins " {{{
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/hallison/vim-markdown.git'
NeoBundle 'git://github.com/tyru/open-browser.vim.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/mattn/gist-vim.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/h1mesuke/vim-alignta.git'
NeoBundle 'git://github.com/othree/html5.vim.git'
NeoBundle 'git://github.com/hail2u/vim-css3-syntax.git'
NeoBundle 'git://github.com/pangloss/vim-javascript.git'
NeoBundle 'git://github.com/nono/jquery.vim.git'
NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'

filetype plugin indent on
" }}}

" ------------------------------
" plugins settings " {{{
" Kaoriya " {{{
let g:plugin_verifyenc_disable = 1
" }}}

" unite.vim " {{{
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 50
let g:unite_source_file_mru_filename_format = ''
" }}}

"" quickrun " {{{
"let g:quickrun_config = {}
"let g:quickrun_config['markdown'] = {
"    \ 'type': 'markdown/pandoc',
"    \ 'cmdopt': '-s',
"    \ 'outputter': 'browser'
"    \ }
"" }}}

" gist " {{{
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_put_url_to_clipboard_after_post = 1
" }}}
" }}}

" ------------------------------
" display " {{{
set cursorline
set number
set ruler
set wildmenu
set wrap
set laststatus=2
set showcmd
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set hidden
set shortmess+=I
set term=xterm
" }}}

" ------------------------------
" syntax " {{{
syntax enable

" php settings " {{{
let php_sql_query = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_folding = 1
" }}}
" }}}

" ------------------------------
" search " {{{
set ignorecase
set smartcase
set incsearch
set hlsearch
" }}}

" ------------------------------
" help priority " {{{
set helplang=ja,en
" }}}

" ------------------------------
" print " {{{
set printoptions=header:0
" }}}

" ------------------------------
" edit " {{{
set autoindent
set smartindent
set showmatch
set backspace=indent,eol,start
set clipboard=unnamed
" }}}

" ------------------------------
" fold " {{{
set foldmethod=marker
set commentstring=\"%s
" }}}

" ------------------------------
" list " {{{
set list
set listchars=eol:~,tab:>-,trail:-,nbsp:%,extends:>,precedes:<
" }}}

" ------------------------------
" tab " {{{
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
" }}}

" ------------------------------
" backup/swap " {{{
set backup
set backupdir=~/vimbackup
set browsedir=current
set noswapfile
set directory=~/vimbackup
" }}}

" ------------------------------
" encoding " {{{
"" > http://www.kawaz.jp/pukiwiki/?vim#cb691f26
if &encoding !=# 'utf-8'
    set encoding=japan
    set fileencoding=japan
endif
if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    " iconvがeucJP-msに対応しているかをチェック
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'eucjp-ms'
        let s:enc_jis = 'iso-2022-jp-3'
        " iconvがJISX0213に対応しているかをチェック
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    " fileencodingsを構築
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        let &fileencodings = &fileencodings .','. s:fileencodings_default
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
            set fileencodings+=cp932
            set fileencodings-=euc-jp
            set fileencodings-=euc-jisx0213
            set fileencodings-=eucjp-ms
            let &encoding = s:enc_euc
            let &fileencoding = s:enc_euc
        else
            let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    " 定数を処分
    unlet s:enc_euc
    unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
    function! AU_ReCheck_FENC()
        if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
            let &fileencoding=&encoding
        endif
    endfunction
    autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
    set ambiwidth=double
endif
" }}}

" ------------------------------
" keymap " {{{
let mapleader = "m"
inoremap <silent> <Esc> <Esc>:set iminsert=0<CR>
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-h> <BS>
inoremap <silent> <C-d> <Del>
vnoremap <silent> v $h
nnoremap <silent> <Esc><Esc> :<C-u>noh<CR><Esc>
nnoremap <silent> <Space> jzz
nnoremap <silent> <S-Space> kzz
nnoremap <silent> <Leader>a ggyG:bd!<CR>
nnoremap <silent> <Leader>b :Unite buffer<CR>
nnoremap <silent> <Leader>x :<C-u>bd!<CR>
noremap <silent> j gj
noremap <silent> k gk
noremap <CR> i<CR><Esc>
noremap <silent> J gJ

" Unite keymap " {{{
nnoremap [unite] <Nop>
nmap <Leader>u [unite]
nnoremap <silent> [unite]a :<C-u>Unite buffer file_mru file history/yank<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
" }}}
" }}}

" ------------------------------
" autocmd " {{{
if has('autocmd')
    augroup MySettings
        autocmd!
    augroup END

    autocmd FileType * setl formatoptions-=ro
    autocmd MySettings BufNewFile,BufRead *.html,*.php,*.js,*.css setl shiftwidth=2
    autocmd MySettings BufNewFile,BufRead *.html,*.php,*.js,*.css setl softtabstop=2
endif
" }}}

set secure

" vim: foldmethod=marker:
