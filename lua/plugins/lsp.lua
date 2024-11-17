return {
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	{
		"VonHeikemen/lsp-zero.nvim",
		config = function()
			-- Reserve a space in the gutter
			-- This will avoid an annoying layout shift in the screen
			vim.opt.signcolumn = 'yes'

			-- Add cmp_nvim_lsp capabilities settings to lspconfig
			-- This should be executed before you configure any language server
			local lspconfig_defaults = require('lspconfig').util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
 				'force',
 				lspconfig_defaults.capabilities,
 				require('cmp_nvim_lsp').default_capabilities()
			)

			vim.api.nvim_create_autocmd('LspAttach', {
 				desc = 'LSP actions',
 				callback = function(event)
 				  local opts = {buffer = event.buf}

 				  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
 				  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
 				  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
 				  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
 				  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
 				  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
 				  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
 				  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
 				  vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
 				  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
 				end,
			})

			-- Setup Languages
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemtry = {
							enable = false,
						},
					},
				},
			})
			require("lspconfig").clangd.setup({})

			-- Setup CMP
			local cmp = require("cmp")
			cmp.setup({
    				snippet = {
      					expand = function(args)
        					vim.snippet.expand(args.body)
      					end,
    				},
    				window = {
   				  -- completion = cmp.config.window.bordered(),
   				  -- documentation = cmp.config.window.bordered(),
   				},
   				mapping = cmp.mapping.preset.insert({
   				  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
   				  ['<C-f>'] = cmp.mapping.scroll_docs(4),
   				  ['<C-Space>'] = cmp.mapping.complete(),
   				  ['<C-e>'] = cmp.mapping.abort(),
   				  ['<CR>'] = cmp.mapping.confirm({ select = true }),
   				}),
   				sources = cmp.config.sources({
   				  { name = 'nvim_lsp' },
   				}, {
   				  { name = 'buffer' },
   				})
  			})

			-- Setup Mason
			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
				automatic_installation = true,
			})
		end,
	},
}
