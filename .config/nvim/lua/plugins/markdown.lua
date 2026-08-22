return {
    -- Markdown render
    {
        'delphinus/md-render.nvim',
        version = '*',
        ft = { 'markdown' },
        dependencies = {
            { 'nvim-tree/nvim-web-devicons', version = '*' },
            { 'delphinus/budoux.lua', version = '*' },
        },
        keys = {
            { '<Leader>mp', '<Plug>(md-render-preview)', desc = 'Markdown preview (toggle)' },
            { '<Leader>mt', '<Plug>(md-render-preview-tab)', desc = 'Markdown preview in tab (toggle)' },
            { '<Leader>md', '<Plug>(md-render-demo)', desc = 'Markdown render demo' },
        },
    },
}
