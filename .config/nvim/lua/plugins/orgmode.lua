return {
    {
        'nvim-orgmode/orgmode',
        dependencies = {
            'nvim-orgmode/org-bullets.nvim',
        },
        event = 'VeryLazy',
        ft = {'org'},
        config = function()
            require('plugin_settings/orgmode')
        end,
    },
}
