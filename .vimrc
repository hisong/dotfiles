set nocompatible
filetype off

" ------------------------------
" runtimepath
" ------------------------------
for path in split(glob($VIM.'/plugins/*'), '\n')
    if isdirectory(path) | let &runtimepath = &runtimepath.','.path | end
endfor

" ------------------------------
" NeoBundle
" ------------------------------
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

" ------------------------------
" plugins
" ------------------------------
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tsaleh/vim-align'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/vimplenote-vim'
NeoBundle 'mattn/learn-vimscript'
NeoBundle 'motemen/hatena-vim'
NeoBundle 'sudo.vim'
NeoBundle 'mru.vim'
NeoBundle 'TwitVim'
NeoBundle 'koron/chalice'
NeoBundle 'altercation/vim-colors-solarized'

filetype plugin indent on
" ------------------------------
" plugins settings
" ------------------------------
set shellslash
" neocomplcache
let g:neocomplcache_enable_at_startup = 0
" unite.vim
let g:unite_enable_start_insert = 1
" vimfiler
let g:vimfiler_as_default_explorer = 1
" quickrun
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
    \ 'type': 'markdown/pandoc',
    \ 'outputter': 'browser'
    \ }
" TwitVim
let twitvim_api_root = "https://api.twitter.com/1"
let twitvim_count = 100

" ------------------------------
" display
" ------------------------------
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

" ------------------------------
" syntax color
" ------------------------------
syntax on

" ------------------------------
" search
" ------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch

" ------------------------------
" help priority
" ------------------------------
set helplang=ja,en

" ------------------------------
" print
" ------------------------------
set printoptions=header:0

" ------------------------------
" edit
" ------------------------------
set autoindent
set smartindent
set showmatch
set backspace=indent,eol,start
set clipboard=unnamed
set autochdir

" ------------------------------
" list
" ------------------------------
set list
set listchars=eol:~,tab:>-,trail:-,nbsp:%,extends:>,precedes:<

" ------------------------------
" tab
" ------------------------------
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4

" ------------------------------
" backup/swap
" ------------------------------
set backup
set backupdir=$HOME/vimbackup
set browsedir=current
set swapfile
set directory=$HOME/vimbackup

" ------------------------------
" encoding
" > http://www.kawaz.jp/pukiwiki/?vim#cb691f26
" ------------------------------
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

" ------------------------------
" keymap
" ------------------------------
inoremap <C-s> <Esc>:w<CR>
inoremap <silent> <Esc> <Esc>:set iminsert=0<CR>
vnoremap v $h
nnoremap <Esc><Esc> :noh<CR><Esc>
nnoremap bb :ls<CR>:buf 
nnoremap ,x :w<CR>:bd<CR>
nnoremap <silent> ,m :MRU<CR>
nnoremap <silent> ,u :Unite buffer file_mru file<CR>
nnoremap <silent> ,tf :FriendsTwitter<CR>
nnoremap ,tl :ListTwitter 
nnoremap <silent> ,tn :NextTwitter<CR>
nnoremap <silent> ,tp :PosttoTwitter<CR>
noremap <C-s> :w<CR>
noremap j gj
noremap k gk
noremap <CR> i<CR><Esc>
noremap J gJ
