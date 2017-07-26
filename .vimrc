set encoding=utf-8
scriptencoding utf-8

" minpac {{{
set packpath^=~/.vim
packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('haya14busa/vim-migemo')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-fugitive')
call minpac#add('kana/vim-operator-user')
call minpac#add('kana/vim-operator-replace')
call minpac#add('kana/vim-fakeclip')
call minpac#add('kana/vim-submode')
call minpac#add('itchyny/lightline.vim')
call minpac#add('h1mesuke/vim-alignta')
call minpac#add('othree/html5.vim')
call minpac#add('othree/javascript-libraries-syntax.vim')
call minpac#add('hail2u/vim-css3-syntax')
call minpac#add('vim-jp/vimdoc-ja')
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('w0ng/vim-hybrid')
call minpac#add('chriskempson/vim-tomorrow-theme')
call minpac#add('ciaranm/inkpot')

packloadall

filetype plugin indent on
" }}}

" plugins settings {{{
" Kaoriya " {{{
let g:plugin_verifyenc_disable = 1
" }}}

" ctrlp settings {{{
let g:ctrlp_use_migemo = 1
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
set display=lastline
set pumheight=10
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
set clipboard=unnamedplus
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
set backupdir=~/vimbackup
set browsedir=current
set noswapfile
set directory=~/vimbackup
set undodir=~/vimbackup
" }}}

" encoding {{{
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
    set ambiwidth=double
endif
" }}}

" keymap {{{
let g:mapleader = "m"
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
nnoremap <silent> <Leader>a ggVGy
nnoremap <silent> <Leader>t :<C-u>tabnew<CR>
nnoremap <Leader>/ /\v
nnoremap <Leader>mu :<C-u>call minpac#update()<CR>
nnoremap Y y$
noremap <silent> j gj
noremap <silent> k gk
noremap <CR> i<CR><Esc>
noremap <silent> J gJ
nmap <silent> <Leader>vs :vsplit<bar>wincmd l<bar>exe "norm! Ljz<c-v><cr>"<cr>:set scb<cr>:wincmd h<cr>:set scb<cr>

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
        autocmd BufNewFile,BUfRead *.bat,*.log setl nowrap
        autocmd BufNewFile,BUfRead *.sh setl noexpandtab
        autocmd QuickFixCmdPost *grep* cwindow
        autocmd FileType * setl formatoptions-=ro
    augroup END
endif
" }}}

set secure

" vim: foldmethod=marker:
