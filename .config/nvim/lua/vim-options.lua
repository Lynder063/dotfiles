vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")

vim.cmd("set cursorline")

vim.cmd("set relativenumber")

vim.cmd("set splitbelow")

vim.cmd("set clipboard=unnamedplus")

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber norelativenumber | startinsert",
})
vim.g.vimtex_syntax_enabled = 0
vim.g.mapleader = " "
