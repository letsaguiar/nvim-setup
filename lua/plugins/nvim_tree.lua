return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.opt.termguicolors = true

		require("nvim-tree").setup({
			git = {
				enable = true,
				ignore = false,
				timeout = 400,
			},
			renderer = {
				highlight_git = true,
				highlight_diagnostics = true,
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = false,
						git = false,
					},
				},
			},
		})
	end,
}
