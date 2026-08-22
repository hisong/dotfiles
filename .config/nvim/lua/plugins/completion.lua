return {
    -- Completion base
    {
        'Shougo/ddc.vim',
        dependencies = {
            'vim-denops/denops.vim',
            'vim-skk/skkeleton',
            'Shougo/pum.vim',
            'Shougo/ddc-ui-pum',
            'Shougo/ddc-filter-matcher_head',
            'Shougo/ddc-filter-sorter_rank',
        },
        config = function()
            require('plugin_settings.ddc')
        end,
    },
}
