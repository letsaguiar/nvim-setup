return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
	require ("nvim-treesitter.configs").setup({
		ensure_installed = { "lua", "vim" },
		sync_install = true,
		highlight = {
			enbled = true,

		}
	})
  end,
}
