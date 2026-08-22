return {
    -- Denops base
    {
        'vim-denops/denops.vim',
        lazy = false,
        init = function()
            require('plugin_settings/deno')
        end,
    },
}
