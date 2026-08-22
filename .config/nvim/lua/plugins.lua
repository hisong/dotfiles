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

local plugins = {}

vim.list_extend(plugins, require('plugins.denops'))
vim.list_extend(plugins, require('plugins.input'))
vim.list_extend(plugins, require('plugins.completion'))
vim.list_extend(plugins, require('plugins.markdown'))
vim.list_extend(plugins, require('plugins.ui'))

-- Orgmode / Linux only
if is_linux then
    vim.list_extend(plugins, require('plugins.orgmode'))
end

require('lazy').setup(plugins, {
    rocks = { enabled = false },
})
