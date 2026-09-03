return {
    -- Denops base
    {
        'vim-denops/denops.vim',
        lazy = false,
        init = function()
            vim.g['denops#server#deno_args'] = {
                '-q',
                '--no-lock',
                '-A',
                '--unstable-kv',
            }
        end,
    },
}
