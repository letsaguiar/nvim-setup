local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "<leader>vf", vim.cmd.Ex)

-- Basic Search
map("n", "<C-f>", [[:%s///g<Left><Left>]], { noremap = true, silent = false })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

-- Undotree
map("n", "<leader>u", "<cmd>UndotreeToggle<cr>")

-- Nvim Tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
map("n", "<leader>p", "<cmd>NvimTreeFocus<cr>")
