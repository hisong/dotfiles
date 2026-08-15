-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git', 'clone', '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { 'vim-denops/denops.vim' },
    { 'vim-skk/skkeleton' },
    { 'delphinus/skkeleton_indicator.nvim' },
    { 'nvim-orgmode/orgmode' },
    { 'itchyny/lightline.vim' },
    { 'Shougo/ddc.vim' },
    { 'Shougo/pum.vim' },
    { 'Shougo/ddc-ui-pum' },
    { 'Shougo/ddc-filter-matcher_head' },
    { 'Shougo/ddc-filter-sorter_rank' },
}, {
    rocks = { enabled = false },
})
