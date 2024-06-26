return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		build = ":TSUpdate",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({

				-- Internal modules
				ensure_installed = { "lua", "vim", "vimdoc", "markdown" },
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<Enter>",
						node_incremental = "<Enter>",
						node_decremental = "<BS>",
					},
				},

				-- External plugins
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["am"] = "@function.outer",
							["im"] = "@function.inner",
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["ac"] = "@call.outer",
							["ic"] = "@call.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- register in jump list
						goto_next_start = {
							["m"] = "@function.outer",
						},
						goto_previous_start = {
							["M"] = "@function.outer",
						},
					},
				},
			})
		end,
	},
}
