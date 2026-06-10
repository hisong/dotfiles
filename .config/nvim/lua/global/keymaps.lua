-- keymaps
local is_linux = vim.loop.os_uname().sysname == 'Linux'

vim.g.mapleader = 'm'
vim.keymap.set('i', '<C-a>', '<C-G>U<Home>', {silent = true})
vim.keymap.set('i', '<C-e>', '<C-G>U<End>', {silent = true})
vim.keymap.set('i', '<C-b>', '<C-G>U<Left>', {silent = true})
vim.keymap.set('i', '<C-f>', '<C-G>U<Right>', {silent = true})
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('v', 'v', '$h')
vim.keymap.set('n', '<Esc><Esc>', ':<C-u>noh<CR><Esc>', {silent = true})
vim.keymap.set('n', '<Leader>a', 'ggVGy', {silent = true})
vim.keymap.set('n', '<Leader>t', ':<C-u>tabnew<CR>', {silent = true})
vim.keymap.set('n', '<Leader>n', ':<C-u>enew<CR>', {silent = true})
vim.keymap.set('n', '<Leader>/', '/\v')
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('', 'J', 'gJ', {silent = true})

if is_linux then
  vim.keymap.set('n', '<Leader>uu', ':<C-u>Lazy update<CR>')
else
  vim.keymap.set('n', '<Leader>uu', ':<C-u>JetpackSync<CR>')
end
