-- .vimrc {{{
vim.opt.fileformats = 'unix,dos,mac'

-- display {{{
vim.opt.number = true
vim.opt.ruler = true
vim.opt.wildmenu = true
vim.opt.wrap = true
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.hidden = true
vim.opt.shortmess:append('I')
vim.opt.display = 'lastline'
vim.opt.pumheight = 10
-- }}}

-- search {{{
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
-- }}}

-- help priority {{{
vim.opt.helplang = 'ja,en'
-- }}}

-- edit {{{
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showmatch = true
vim.opt.startofline = true
vim.opt.mouse:remove('a')
vim.opt.backspace = 'indent,eol,start'
vim.opt.clipboard:append{'unnamedplus'}
-- }}}

-- fold {{{
vim.opt.foldmethod = 'marker'
vim.opt.commentstring = '\"%s'
-- }}}

-- list {{{
vim.opt.list = true
vim.opt.listchars = {
    eol = '↲',
    tab = '▸ ',
    trail = '-',
    nbsp = '%',
    extends = '»',
    precedes = '«',
}
-- }}}

-- tab {{{
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
-- }}}

-- backup/swap/undo {{{
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand('~/.config/vimbackup')
vim.opt.browsedir = 'current'
vim.opt.swapfile = true
vim.opt.directory = vim.fn.expand('~/.config/swp')
vim.opt.undodir = vim.fn.expand('~/.config/undo')
-- }}}
-- }}}

-- .gvimrc {{{
-- display {{{
vim.opt.showtabline = 2
vim.opt.guioptions = 'gLt'
vim.opt.guicursor = 'a:blinkon0'
vim.opt.background = 'dark'

vim.g.lightline = {
    colorscheme = 'wombat',
    active = {
        left = {
            { 'mode', 'paste' },
            { 'readonly', 'filename', 'modified' },
        },
    },
}

vim.cmd('colorscheme wombat')
-- }}}

-- font {{{
vim.opt.guifont = 'HackGen:h14'
-- }}}

-- ambiguous {{{
vim.opt.ambiwidth = 'double'
-- }}}
-- }}}

