local keymap = vim.keymap

-- keymap.set("mode", "keybind", "command<CR>", { noremap = true, silent = true })

-- Telescope
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })

-- Indenting
keymap.set("v", "<","<gv") -- Shift Indentation to Left
keymap.set("v", ">",">gv") -- Shift Indentation to Right

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<leader>/", "gbc", { noremap = false })

-- Neo tree
keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
