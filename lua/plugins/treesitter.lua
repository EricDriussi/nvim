require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	sync_install = false,
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	-- Plugins!
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1500, -- Do not enable for files with more than n lines, int
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	-- Add [M]ethod as vim text object
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["am"] = "@function.outer",
				["im"] = "@function.inner",
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
