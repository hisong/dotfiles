vim.cmd('packadd vim-jetpack')

require('jetpack.packer').add({
    { 'tani/vim-jetpack' },
    { 'vim-denops/denops.vim' },
    { 'vim-skk/skkeleton' },
    { 'delphinus/skkeleton_indicator.nvim' },
    { 'itchyny/lightline.vim' },
    { 'Shougo/ddc.vim' },
    { 'Shougo/pum.vim' },
    { 'Shougo/ddc-ui-pum' },
    { 'Shougo/ddc-filter-matcher_head' },
    { 'Shougo/ddc-filter-sorter_rank' },
    { 'vim-jp/vimdoc-ja' },
    { 'NLKNguyen/papercolor-theme' },
})

