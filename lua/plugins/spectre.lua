return {
	"windwp/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	opts = {
		line_sep_start = "",
		result_padding = "│  ",
		line_sep = "",
		default = {
			find = {
				cmd = "rg",
				options = {},
			},
		},
	},
}
