-- keymaps
local is_wsl = vim.fn.exists('$WSL_DISTRO_NAME') == 1
vim.g.mapleader = 'm'
vim.keymap.set('i', '<C-a>', '<C-G>U<Home>', {silent = true})
vim.keymap.set('i', '<C-e>', '<C-G>U<End>', {silent = true})
vim.keymap.set('i', '<C-b>', '<C-G>U<Left>', {silent = true})
vim.keymap.set('i', '<C-f>', '<C-G>U<Right>', {silent = true})
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('v', 'v', '$h')
vim.keymap.set('n', '<Esc><Esc>', ':<C-u>noh<CR><Esc>', {silent = true})
vim.keymap.set('n', '<Leader>t', ':<C-u>tabnew<CR>', {silent = true})
vim.keymap.set('n', '<Leader>n', ':<C-u>enew<CR>', {silent = true})
vim.keymap.set('n', '<Leader>/', '/\\v')
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('', 'J', 'gJ', {silent = true})
vim.keymap.set('n', '<Leader>uu', ':<C-u>Lazy update<CR>')
if is_wsl then
    vim.keymap.set('n', '<Leader>a', 'ggVG"+y', {silent = true})
    vim.keymap.set({'n', 'v'}, '<Leader>y', '"+y', {silent = true})
    vim.keymap.set('n', '<Leader>p', '"+p', {silent = true})
    vim.keymap.set('n', '<Leader>P', '"+P', {silent = true})
else
    vim.keymap.set('n', '<Leader>a', 'ggVGy', {silent = true})
end
