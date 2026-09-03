return {
    -- Completion base (ddc)
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
            vim.fn['ddc#custom#patch_global']('sources', {'skkeleton'})
            vim.fn['ddc#custom#patch_global']('sourceOptions', {
                ['_'] = {
                    matchers = {'matcher_head'},
                    sorters = {'sorter_rank'},
                },
                ['skkeleton'] = {
                    mark = 'skkeleton',
                    matchers = {},
                    sorters = {},
                    converters = {},
                    isVolatile = true,
                    minAutoCompleteLength = 1,
                },
            })
            vim.fn['ddc#enable']()
            vim.fn['ddc#custom#patch_global']('ui', 'pum')

            -- keymaps (pum)
            local opts = {silent = true}
            vim.keymap.set({'i', 'c'}, '<C-n>', '<Cmd>call pum#map#insert_relative(+1)<CR>', opts)
            vim.keymap.set({'i', 'c'}, '<C-p>', '<Cmd>call pum#map#insert_relative(-1)<CR>', opts)
            vim.keymap.set({'i', 'c'}, '<C-y>', '<Cmd>call pum#map#confirm()<CR>', opts)
            --vim.keymap.set({'i', 'c'}, '<C-e>', '<Cmd>call pum#map#cancel()<CR>', opts)
        end,
    },
}
