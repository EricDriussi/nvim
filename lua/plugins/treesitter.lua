return function()
	require("nvim-treesitter.configs").setup({
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<Enter>",
				node_incremental = "<Enter>",
				node_decremental = "<BS>",
			},
		},
		ensure_installed = "all",
		sync_install = false,
		highlight = {
			enable = true,
		},
		indent = { enable = true },
		-- Plugins!
		rainbow = {
			enable = true,
		},
		autopairs = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
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
end
