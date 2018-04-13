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
set t_Co=256
set display=lastline
set pumheight=10
set termguicolors
" }}}

" search {{{
set ignorecase
set smartcase
set incsearch
set hlsearch
" }}}

" edit {{{
set autoindent
set smartindent
set showmatch
set backspace=indent,eol,start
set clipboard+=unnamedplus
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

" vim: foldmethod=marker:
