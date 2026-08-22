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

-- keymaps/ddc
vim.keymap.set({'i', 'c'}, '<C-n>', '<Cmd>call pum#map#insert_relative(+1)<CR>', {silent = true})
vim.keymap.set({'i', 'c'}, '<C-p>', '<Cmd>call pum#map#insert_relative(-1)<CR>', {silent = true})
vim.keymap.set({'i', 'c'}, '<C-y>', '<Cmd>call pum#map#confirm()<CR>', {silent = true})
--vim.keymap.set({'i', 'c'}, '<C-e>', '<Cmd>call pum#map#cancel()<CR>', {silent = true})
