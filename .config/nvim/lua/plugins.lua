local is_linux = vim.loop.os_uname().sysname == 'Linux'

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git', 'clone', '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Denops base
    {
        'vim-denops/denops.vim',
        lazy = false,
    },

    -- Japanese input
    {
        'vim-skk/skkeleton',
        dependencies = {
            'vim-denops/denops.vim',
        },
    },
    {
        'delphinus/skkeleton_indicator.nvim',
        dependencies = {
            'vim-skk/skkeleton',
        },
    },

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

    -- Statusline
    {
        'itchyny/lightline.vim',
    },
}

-- Orgmode / Linux only
if is_linux then
    table.insert(plugins, {
        'nvim-orgmode/orgmode',
        dependencies = {
            'nvim-orgmode/org-bullets.nvim',
        },
        event = 'VeryLazy',
        ft = {'org'},
        config = function()
            require('plugin_settings/orgmode')
        end,
    })
end

require('lazy').setup(plugins, {
    rocks = { enabled = false },
})
