local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<j>"] = "move_selection_next",
					["<k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = true,
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = false,
			},
			buffers = {
				theme = "dropdown",
				previewer = false,
			},
		},
	})
end

return {{
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		lazy = false,
		config = function()
			require("telescope").setup {
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown {
					}
				}
			}
		}
		require("telescope").load_extension("ui-select")
		end
	}
}
