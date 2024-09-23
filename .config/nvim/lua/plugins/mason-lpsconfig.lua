return{
	"williamboman/mason-lspconfig",
	opts = {
		ensure_installed = {
			"efm",
			"lua_ls",
			"hyprls",
		},
		automatic_installation = true,
	},
	event = "BufReadPre",
	dependencies = "williamboman/mason-lspconfig",
}

