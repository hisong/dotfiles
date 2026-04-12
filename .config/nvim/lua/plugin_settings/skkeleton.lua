-- main
vim.fn['skkeleton#config']({
    databasePath = vim.fn.expand('~/.config/skk/my_denokv'),
    eggLikeNewline = true,
    lowercaseMap = {
        [':'] = ';',
        ['+'] = ';',
    },
    globalDictionaries = {
        vim.fn.expand('~/.config/skk/dict/SKK-JISYO.L'),
        vim.fn.expand('~/.config/skk/dict/SKK-JISYO.jinmei'),
        vim.fn.expand('~/.config/skk/dict/SKK-JISYO.itaiji'),
        vim.fn.expand('~/.config/skk/dict/SKK-JISYO.geo'),
        vim.fn.expand('~/.config/skk/dict/SKK-JISYO.station'),
        vim.fn.expand('~/.config/skk/dict/SKK-JISYO.propernoun'),
        vim.fn.expand('~/.config/skk/dict/SKK-JISYO.law'),
        vim.fn.expand('~/.config/skk/dict/SKK-JISYO.emoji'),
        vim.fn.expand('~/.config/skk/dict/SKK-JISYO.edict'),
        vim.fn.expand('~/.config/skk/dict/SKK-JISYO.edict2'),
        vim.fn.expand('~/.config/skk/dict/zipcode/SKK-JISYO.zipcode'),
    },
    immediatelyCancel = false,
    keepState = true,
--    markerHenkan = '▿',
--    markerHenkanSelect = '▾',
    registerConvertResult = true,
--    selectCandidateKeys = 'asdfjkl',
    setUndoPoint = false,
    showCandidatesCount = 1,
    sources = {'deno_kv'},
    userDictionary = vim.fn.expand('~/.config/skk/my_jisyo'),
})

require('plugin_settings/skkeleton_mysettings')
--require('plugin_settings/skkeleton_azik')

-- ddc
vim.fn['ddc#custom#patch_global']('sources', {'skkeleton'})
vim.fn['ddc#custom#patch_global']('sourceOptions', {
    ['_'] = {
        matchers = {'matcher_head'},
        sorters = {'sorter_rank'},
    },
    ['skkeleton'] = {
        mark = 'skkeleton',
        matchers = {},
        sorters = {},
        converters = {},
        isVolatile = true,
        minAutoCompleteLength = 1,
    },
})
vim.fn['ddc#enable']()
vim.fn['ddc#custom#patch_global']('ui', 'pum')
vim.fn['skkeleton#config']({completionRankFile = vim.fn.expand('~/.config/skk/my_rank.json')})

-- keymaps/skkeleton
vim.keymap.set({'i', 'c', 't'}, '<C-j>', '<Plug>(skkeleton-enable)', { noremap = false })
vim.keymap.set({'i', 'c', 't'}, '<C-l>', '<Plug>(skkeleton-disable)', { noremap = false })

-- keymaps/ddc
vim.keymap.set({'i', 'c'}, '<C-n>', '<Cmd>call pum#map#insert_relative(+1)<CR>', {silent = true})
vim.keymap.set({'i', 'c'}, '<C-p>', '<Cmd>call pum#map#insert_relative(-1)<CR>', {silent = true})
vim.keymap.set({'i', 'c'}, '<C-y>', '<Cmd>call pum#map#confirm()<CR>', {silent = true})
--vim.keymap.set({'i', 'c'}, '<C-e>', '<Cmd>call pum#map#cancel()<CR>', {silent = true})

