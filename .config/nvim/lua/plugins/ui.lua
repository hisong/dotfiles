return {
    -- Statusline
    {
        'itchyny/lightline.vim',
        init = function()
            vim.g.lightline = {
                active = {
                    left = {
                        { 'mode', 'paste' },
                        { 'readonly', 'filename', 'modified' },
                    },
                },
            }
        end,
    },
}
