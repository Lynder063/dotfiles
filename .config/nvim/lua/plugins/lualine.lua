return { 'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
		lazy = false,
		config = function ()
			require('lualine').setup({
				options = {
						icons_enabled = true,
						theme =  'auto',
				}
		})
	end
}
