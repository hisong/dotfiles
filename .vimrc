set encoding=utf-8
set fileformats=unix,dos,mac
scriptencoding utf-8

" Jetpack {{{
set packpath^=~/.vim
packadd vim-jetpack
call jetpack#begin('~/.vim')
Jetpack 'tani/vim-jetpack', {'opt': 1}
Jetpack 'vim-denops/denops.vim'
Jetpack 'vim-skk/skkeleton'
Jetpack 'yasunori0418/statusline_skk.vim'
Jetpack 'haya14busa/vim-migemo'
Jetpack 'ctrlpvim/ctrlp.vim'
Jetpack 'preservim/nerdtree'
Jetpack 'tpope/vim-surround'
Jetpack 'tpope/vim-fugitive'
Jetpack 'easymotion/vim-easymotion'
Jetpack 'kana/vim-operator-user'
Jetpack 'kana/vim-operator-replace'
Jetpack 'kana/vim-fakeclip'
Jetpack 'kana/vim-submode'
Jetpack 'itchyny/lightline.vim'
Jetpack 'h1mesuke/vim-alignta'
Jetpack 'vim-jp/vimdoc-ja'
Jetpack 'sheerun/vim-wombat-scheme'
call jetpack#end()

filetype plugin indent on
" }}}

" plugins settings {{{
" deno " {{{
let g:denops#server#deno_args = [
\ '-q',
\ '--no-lock',
\ '-A',
\ '--unstable-kv',
\ ]
" }}}

" skkeleton " {{{
call skkeleton#config({
\   'databasePath': "~/.config/skk/my_denokv",
\   'eggLikeNewline': v:true,
\   'globalDictionaries': [
\       "~/.config/skk/dict/SKK-JISYO.L",
\       "~/.config/skk/dict/SKK-JISYO.jinmei",
\       "~/.config/skk/dict/SKK-JISYO.itaiji",
\       "~/.config/skk/dict/SKK-JISYO.geo",
\       "~/.config/skk/dict/SKK-JISYO.station",
\       "~/.config/skk/dict/SKK-JISYO.propernoun",
\       "~/.config/skk/dict/SKK-JISYO.law",
\       "~/.config/skk/dict/SKK-JISYO.emoji",
\       "~/.config/skk/dict/SKK-JISYO.edict",
\       "~/.config/skk/dict/SKK-JISYO.edict2",
\       "~/.config/skk/dict/zipcode/SKK-JISYO.zipcode",
\   ],
\   'immediatelyCancel': v:false,
\   'keepState': v:true,
\   'selectCandidateKeys': "asdfjkl",
\   'setUndoPoint': v:false,
\   'showCandidatesCount': 1,
\   'sources': ['deno_kv'],
\   'userDictionary': "~/.config/skk/my_jisyo",
\})

call skkeleton#register_kanatable('rom', {
\   'z;': ["：", ""],
\   'z:': ["；", ""],
\   '(': ["（", ""],
\   ')': ["）", ""],
\})
" }}}

" Kaoriya " {{{
let g:plugin_verifyenc_disable = 1
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
let g:lightline_skk_announce = v:true

let g:lightline = {
\   'colorscheme': 'wombat',
\   'active': {
\       'left': [ [ 'mode', 'paste', 'skk_mode' ],
\                 [ 'readonly', 'filename', 'modified' ] ]
\   },
\   'component_function': {
\       'skk_mode': 'g:lightline_skk#mode',
\   },
\}
" }}}

" javascript-libraries-syntax " {{{
let g:used_javascript_libs = 'jquery'
" }}}
" }}}

" display {{{
set number
set ruler
set wildmenu
set wrap
set laststatus=2
set showcmd
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set hidden
set shortmess+=I
set display=lastline
set pumheight=10
set smoothscroll
" }}}

" term {{{
if has('unix')
    set term=xterm

    " True Color {{{
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" }}}
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
set matchpairs+=（:）,「:」,『:』,【:】,［:］,＜:＞
set mouse-=a
set backspace=indent,eol,start
set clipboard=unnamed
" }}}

" fold {{{
set foldmethod=marker
set commentstring=\"%s
" }}}

" list {{{
set list
set listchars=eol:↲,tab:▸\ ,trail:-,nbsp:%,extends:»,precedes:«
" }}}

" tab {{{
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=0
" }}}

" backup/swap/undo {{{
set backup
set backupdir=~/.vim/vimbackup
set browsedir=current
set swapfile
set directory=~/.vim/swp
set undodir=~/.vim/undo
" }}}

" ambiguous {{{
" □とか○の文字があってもカーソル位置がずれないようにする
" .gvimrcに設定しているがターミナルでvimを実行した際に読み込まれないため追加
if exists('&ambiwidth')
    set ambiwidth=double
endif
" }}}

" keymap {{{
let g:mapleader = "m"
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-b> <C-G>U<Left>
inoremap <silent> <C-f> <C-G>U<Right>
inoremap <silent> <expr> <C-k> col('.')==col('$')?'':'<C-o>D'
inoremap <silent> jj <Esc>
vnoremap <silent> v $h
nnoremap <silent> <Esc><Esc> :<C-u>noh<CR><Esc>
nnoremap <silent> <Leader>a ggVGy
nnoremap <silent> <Leader>t :<C-u>tabnew<CR>
nnoremap <silent> <Leader>b :<C-u>enew<CR>
nnoremap <silent> <Leader>fb :call FontSizeChange(2)<CR>
nnoremap <silent> <Leader>fs :call FontSizeChange(-2)<CR>
nnoremap <silent> <Leader>fr :<C-u>set guifont=HackGen:h14<CR>
nnoremap <Leader>/ /\v
nnoremap <Leader>uu :<C-u>JetpackSync<CR>
nnoremap Y y$
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> gj j
noremap <silent> gk k
noremap <silent> J gJ
nmap <silent> <Leader>vs :vsplit<bar>wincmd l<bar>exe "norm! Ljz<c-v><cr>"<cr>:set scb<cr>:wincmd h<cr>:set scb<cr>

" skkeleton keymap " {{{
imap <C-j> <Plug>(skkeleton-enable)
cmap <C-j> <Plug>(skkeleton-enable)
tmap <C-j> <Plug>(skkeleton-enable)
" }}}

" easy-motion keymap " {{{
map <Leader>w <Plug>(easymotion-prefix)
" }}}

" fakeclip keymap " {{{
if has('unix')
    noremap <silent> <Leader>y "+y
    noremap <silent> <Leader>Y "+Y
    noremap <silent> <Leader>p "+p
    noremap <silent> <Leader>P "+P
endif
" }}}
" }}}

" autocmd {{{
if has('autocmd')
    augroup MySettings
        autocmd!
        autocmd BufNewFile,BufRead *.html,*.css,*.xml setl shiftwidth=2 softtabstop=2 nowrap foldmethod=marker
        autocmd BufNewFile,BufRead *.php,*.js,*.json setl shiftwidth=2 softtabstop=2 nowrap foldmethod=marker commentstring=//\ %s
        autocmd BufNewFile,BufRead *.bat,*.log setl nowrap
        autocmd BufNewFile,BufRead *.sh setl noexpandtab
        autocmd QuickFixCmdPost *grep* cwindow
        autocmd FileType * setl formatoptions-=ro
        autocmd FileType mail setl colorcolumn=70
        autocmd FileType comment setl wrapmargin=40 formatoptions+=mM
    augroup END
endif
" }}}

set secure

" vim: foldmethod=marker:
