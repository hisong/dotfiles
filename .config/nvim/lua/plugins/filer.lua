return {
    -- File explorer
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            { 'nvim-tree/nvim-web-devicons', version = '*' },
        },
        cmd = {
            'NvimTreeToggle',
            'NvimTreeOpen',
            'NvimTreeFocus',
            'NvimTreeFindFile',
        },
        keys = {
            { '<Leader>e', '<Cmd>NvimTreeToggle<CR>',   desc = 'File explorer (toggle)' },
            { '<Leader>E', '<Cmd>NvimTreeFindFile<CR>', desc = 'File explorer (reveal current file)' },
        },
        init = function()
            -- nvim-tree を使う場合は netrw を無効化するのが推奨
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        config = function()
            require('nvim-tree').setup({
                sort = { sorter = 'case_sensitive' },
                view = {
                    width = 32,
                    -- number = false, relativenumber = false,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = false,
                },
                update_focused_file = {
                    enable = true,
                },
            })
        end,
    },
}
