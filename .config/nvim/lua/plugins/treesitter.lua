return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			auto_install = true,
			sync_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
