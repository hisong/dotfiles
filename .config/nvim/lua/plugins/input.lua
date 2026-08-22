return {
    -- Japanese input
    {
        'vim-skk/skkeleton',
        dependencies = {
            'vim-denops/denops.vim',
        },
        config = function()
            require('plugin_settings/skkeleton')
        end,
    },
    {
        'delphinus/skkeleton_indicator.nvim',
        dependencies = {
            'vim-skk/skkeleton',
        },
        config = function()
            require('plugin_settings/skkeleton_indicator')
        end,
    },
}
