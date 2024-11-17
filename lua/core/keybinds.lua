vim.g.mapleader = " "
vim.keymap.set("n", "<leader>vf", vim.cmd.Ex)

vim.keymap.set("n", "<C-n>", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>")

vim.keymap.set("n", "<C-u>", "<cmd>UndotreeToggle<cr>")
