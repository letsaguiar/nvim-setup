vim.g.mapleader = " "
vim.keymap.set("n", "<leader>vf", vim.cmd.Ex)

vim.keymap.set("n", "<C-n>", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<cr>")
