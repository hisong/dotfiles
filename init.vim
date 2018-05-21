" ENV {{{
let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

" Windows版Python設定
if has('win64')
    let g:python3_host_prog="C:\Users\pc0001402\AppData\Local\Programs\Python\Python36\python.exe"
endif
" }}}

" dein {{{
" dein.vimディレクトリの設定
let s:dein_dir = expand('$CACHE/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_dir = expand('$CONFIG/nvim')

if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif
" }}}

" deoplete {{{
let g:deoplete#auto_complete_delay = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#auto_refresh_delay = 100
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000
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
set t_Co=256
set display=lastline
set pumheight=10
set ambiwidth=double
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

" clipboard {{{
set clipboard+=unnamedplus
if system('uname -a | grep -i microsoft') != ""
    let g:clipboard = {
                \   'name'  : 'myClipboard',
                \   'copy'  : {
                \       '+' : 'win32yank.exe -i',
                \       '*' : 'win32yank.exe -i',
                \   },
                \   'paste' : {
                \       '+' : 'win32yank.exe -o',
                \       '*' : 'win32yank.exe -o',
                \   },
                \   'cache_enabled' : 1,
                \   }
endif
" }}}
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
tnoremap <silent> <C-[> <C-\><C-n>

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

colorscheme NeoSolarized

" vim: foldmethod=marker:
