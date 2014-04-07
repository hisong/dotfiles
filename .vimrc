scriptencoding utf-8

" NeoBundle {{{
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
" }}}

" plugins {{{
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/neocomplete.vim.git'
NeoBundle 'Shougo/vimshell.vim.git'
NeoBundle 'Shougo/vimfiler.vim.git'
NeoBundle 'Shougo/vimproc.vim.git', {
            \   'build' : {
            \       'windows'   : 'echo "Sorry, cannot update vimproc binary file in Windows."',
            \       'cygwin'    : 'make -f make_cygwin.mak',
            \       'mac'       : 'make -f make_mac.mak',
            \       'unix'      : 'make -f make_unix.mak',
            \   },
            \ }
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'tyru/open-browser.vim.git'
NeoBundle 'mattn/webapi-vim.git'
NeoBundle 'mattn/gist-vim.git'
NeoBundle 'mattn/emmet-vim.git'
NeoBundle 'koron/codic-vim.git'
NeoBundle 'kana/vim-operator-user.git'
NeoBundle 'kana/vim-operator-replace.git'
NeoBundle 'kana/vim-fakeclip.git'
NeoBundle 'kana/vim-submode.git'
NeoBundle 'osyo-manga/unite-fold.git'
NeoBundle 'itchyny/lightline.vim.git'
NeoBundle 'h1mesuke/vim-alignta.git'
NeoBundle 'rhysd/clever-f.vim.git'
NeoBundle 'rhysd/unite-codic.vim.git'
NeoBundle 'Lokaltog/vim-easymotion.git'
NeoBundle 'Yggdroot/indentLine.git'
NeoBundle 'othree/html5.vim.git'
NeoBundle 'othree/javascript-libraries-syntax.vim.git'
NeoBundle 'hail2u/vim-css3-syntax.git'
NeoBundle 'vim-scripts/sudo.vim.git'
NeoBundle 'vim-jp/vimdoc-ja.git'
NeoBundleLazy 'w0ng/vim-hybrid.git'
NeoBundleLazy 'altercation/vim-colors-solarized.git'

filetype plugin indent on
" }}}

" plugins settings {{{
" Kaoriya " {{{
let g:plugin_verifyenc_disable = 1
" }}}

" unite.vim " {{{
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
let g:unite_source_file_mru_filename_format = ''
" }}}

" vimfiler " {{{
let g:vimfiler_as_default_explorer = 1
" }}}

" neocomplete.vim " {{{
let g:neocomplete#enable_at_startup = 1
" }}}

" gist " {{{
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_put_url_to_clipboard_after_post = 1
" }}}

" operator-replace " {{{
map _ <Plug>(operator-replace)
" }}}

" submode " {{{
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>+')
call submode#map('winsize', 'n', '', '-', '<C-w>-')
" }}}

" lightline " {{{
let g:lightline = {}
let g:lightline.colorscheme = 'solarized'
" }}}

" clever-f " {{{
let g:clever_f_ignore_case = 1
let g:clever_f_smart_case = 1
let g:clever_f_use_migemo = 1
let g:clever_f_fix_key_direction = 1
" }}}

" EasyMotion " {{{
let g:EasyMotion_do_mapping = 0
" }}}

" indentLine " {{{
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '|'
" }}}

" javascript-libraries-syntax " {{{
let g:used_javascript_libs = 'jquery'
" }}}
" }}}

" display {{{
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
set t_Co=256
" }}}

" syntax {{{
syntax enable

" php settings " {{{
let php_sql_query = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_folding = 1
" }}}
" }}}

" search {{{
set ignorecase
set smartcase
set incsearch
set hlsearch
" }}}

" help priority {{{
set helplang=ja,en
" }}}

" print {{{
set printoptions=header:0
" }}}

" edit {{{
set autoindent
set smartindent
set showmatch
set backspace=indent,eol,start
set clipboard=unnamed,autoselect
" }}}

" fold {{{
set foldmethod=marker
set commentstring=\"%s
" }}}

" list {{{
set list
"set listchars=eol:↲,tab:»-,trail:-,nbsp:%,extends:»,precedes:«
set listchars=eol:↲,tab:^-,trail:-,nbsp:%,extends:»,precedes:«
" }}}

" tab {{{
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=0
" }}}

" backup/swap {{{
set backup
set backupdir=~/vimbackup
set browsedir=current
set noswapfile
set directory=~/vimbackup
" }}}

" encoding {{{
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

" keymap {{{
let mapleader = "m"
inoremap <silent> <Esc> <Esc>:set iminsert=0<CR>
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-f> <Right>
inoremap <silent> <expr> <C-k> col('.')==col('$')?'':'<C-o>D'
vnoremap <silent> v $h
nnoremap <silent> <Esc><Esc> :<C-u>noh<CR><Esc>
nnoremap <silent> <Leader>a ggVG"+y
nnoremap <silent> <Leader>t :<C-u>tabnew<CR>
nnoremap <Leader>/ /\v
noremap <silent> j gj
noremap <silent> k gk
noremap <CR> i<CR><Esc>
noremap <silent> J gJ
nmap <silent> <Leader>vs :vsplit<bar>wincmd l<bar>exe "norm! Ljz<c-v><cr>"<cr>:set scb<cr>:wincmd h<cr>:set scb<cr>
nmap <silent> <Leader>p "+p
nmap <silent> <Leader>P "+P

" Unite keymap " {{{
nnoremap [unite] <Nop>
nmap <Leader>u [unite]
nnoremap [unite]a :<C-u>Unite buffer file_mru file history/yank<CR>
nnoremap [unite]b :<C-u>Unite buffer<CR>
nnoremap [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap [unite]m :<C-u>Unite file_mru<CR>
nnoremap [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap [unite]u :<C-u>Unite neobundle/update:all<CR>
nnoremap [unite]y :<C-u>Unite history/yank<CR>
" }}}

" fakeclip keymap " {{{
if has('unix')
    noremap <silent> <Leader>y "+y
    noremap <silent> <Leader>Y "+Y
    noremap <silent> <Leader>p "+p
    noremap <silent> <Leader>P "+P
endif
" }}}

" unite-codic.vim keymap"{{{
nnoremap [unite]c :<C-u>Unite codic<CR>
"}}}
" }}}

" autocmd {{{
if has('autocmd')
    augroup MySettings
        autocmd!
        autocmd BufNewFile,BufRead *.html,*.php,*.js,*.css,*.xml setl shiftwidth=2 softtabstop=2 nowrap
        autocmd BufNewFile,BUfRead *.bat,*.log setl nowrap
        autocmd BufNewFile,BUfRead *.sh setl noexpandtab
        autocmd QuickFixCmdPost *grep* cwindow
        autocmd FileType * setl formatoptions-=ro
    augroup END
endif
" }}}

set secure

" vim: foldmethod=marker:
