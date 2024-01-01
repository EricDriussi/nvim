return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-plenary",
		"nvim-neotest/neotest-python",
		"haydenmeade/neotest-jest",
		"rouge8/neotest-rust",
	},
	lazy = true,
	config = function()
		require("neotest").setup({
			diagnostic = { enabled = false },
			adapters = {
				require("neotest-go")({
					experimental = {
						test_table = true,
					},
					args = { "-count=1", "-timeout=60s" },
				}),
				require("neotest-plenary"),
				require("neotest-python"),
				require("neotest-jest"),
				require("neotest-rust"),
			},
		})
	end,
}
