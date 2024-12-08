return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {"lua_ls", "marksman"}	
		})
	end
}

