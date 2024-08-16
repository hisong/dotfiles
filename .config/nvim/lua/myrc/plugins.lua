-- plugins.lua
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'itchyny/lightline.vim'
    use 'nvim-tree/nvim-web-devicons'
    use {
        'vim-skk/skkeleton',
        requires = {
            {'vim-denops/denops.vim'},
        },
    }
    use 'yasunori0418/statusline_skk.vim'
end)

