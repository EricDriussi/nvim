return {
	"folke/which-key.nvim",
	tag = "v2.1.0",
	event = "VeryLazy",
	config = function()
		local which_key = require("which-key")
		which_key.setup({
			plugins = {
				marks = false,
				registers = false,

				-- Help for vim stuff
				presets = {
					operators = false,
					motions = false,
					text_objects = false,
					windows = false,
					nav = false,
					z = true,
					g = false,
				},
			},
			window = {
				border = "rounded",
				padding = { 2, 2, 2, 2 },
			},
			layout = {
				width = { min = 20, max = 80 },
				spacing = 5,
			},
			-- Ignore keymaps with no label
			ignore_missing = true,
		})
		require("plugins.whichkey.register")()
	end,
}
