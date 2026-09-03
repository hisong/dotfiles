vim.opt.fileformats = 'unix,dos,mac'

-- core（mapleaderなどをプラグイン読み込み前に確定させる）
require('config.options')
require('config.keymaps')

-- plugin manager
require('config.lazy')
