return {
    -- Completion base
    {
        'Shougo/ddc.vim',
        dependencies = {
            'vim-denops/denops.vim',
        },
    },
    {
        'Shougo/pum.vim'
    },
    {
        'Shougo/ddc-ui-pum',
        dependencies = {
            'Shougo/ddc.vim',
            'Shougo/pum.vim',
        },
    },
    {
        'Shougo/ddc-filter-matcher_head',
        dependencies = {
            'Shougo/ddc.vim',
        },
    },
    {
        'Shougo/ddc-filter-sorter_rank',
        dependencies = {
            'Shougo/ddc.vim',
        },
    },
}
