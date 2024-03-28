-- skkeleton
vim.g['denops#server#deno_args'] = {
    '-q',
    '--no-lock',
    '-A',
    '--unstable-kv',
}

vim.fn['skkeleton#config']({
    databasePath = vim.fn.expand('~/.config/skk/my_denokv'),
    eggLikeNewline = true,
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
    selectCandidateKeys = 'asdfjkl',
    setUndoPoint = false,
    showCandidatesCount = 1,
--    sources = {'skk_dictionary'},
    sources = {'deno_kv'},
    userDictionary = vim.fn.expand('~/.config/skk/my_jisyo'),
})

vim.fn['skkeleton#register_kanatable']('rom', {
    ['z;'] = {'：', ''},
    ['z:'] = {'；', ''},
    ['('] = {'（', ''},
    [')'] = {'）', ''},
})

-- keymap
vim.keymap.set('i', '<C-j>', '<Plug>(skkeleton-enable)')
vim.keymap.set('c', '<C-j>', '<Plug>(skkeleton-enable)')
vim.keymap.set('t', '<C-j>', '<Plug>(skkeleton-enable)')

-- skkeleton_indicator
require('skkeleton_indicator').setup {}

