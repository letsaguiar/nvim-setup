return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lsp_status = function()
      local clients = vim.lsp.get_clients({ bufnr = 0 })

      -- Check if there are any active LSP clients
      if next(clients) == nil then
        return "✖"  -- Show "X" icon if no LSP is attached
      end

      -- Collect the names of active LSP clients
      local client_names = {}
      for _, client in ipairs(clients) do
        table.insert(client_names, client.name)
      end

      return table.concat(client_names, ", ")
    end

    local nvim_tree_shift = {
   	function()
   	    local len = vim.api.nvim_win_get_width(require('nvim-tree.view').get_winnr()) - 1
   	    local title = "Nvim-Tree"
   	    local left = (len - #title) / 2
   	    local right = len - left - #title

   	    return string.rep(' ', left) .. title .. string.rep(' ', right)
   	end,
   	cond = require('nvim-tree.view').is_visible,
   	color = 'Normal'
    }


    require("lualine").setup({
      options = {
        section_separators = "",
        component_separators = "",
	disabled_filetypes = {
  		statusline = { "NvimTree" },
	},
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "diagnostics", lsp_status },  -- Add lsp_status to lualine_c
        lualine_x = { "location" },
        lualine_y = { "encoding" },
        lualine_z = { lsp_status }
      },
      tabline = {
        lualine_a = { nvim_tree_shift, "buffers" },  -- Show open buffers in the tabline
        lualine_z = { 'tabs' },     -- Show open tabs in the right side of the tabline
      },
    })
  end,
}

