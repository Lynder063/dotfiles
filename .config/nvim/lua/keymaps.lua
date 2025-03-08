-- Open terminal on split screen
vim.keymap.set('n', '<Leader>ts', ':split | terminal<CR>', {})

-- Při držení Alt + Up posune řádek nahoru
vim.api.nvim_set_keymap('n', '<A-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
-- Při držení Alt + Down posune řádek dolů
vim.api.nvim_set_keymap('n', '<A-Down>', ':m .+1<CR>==', { noremap = true, silent = true })


