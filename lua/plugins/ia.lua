return {
	{
		"jcdickinson/codeium.nvim",
		config = true,
		event = "InsertEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
	},
	{
		"zbirenbaum/copilot-cmp",
		config = true,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/nvim-cmp",
			{
				"zbirenbaum/copilot.lua",
				opts = {
					suggestion = { enabled = false },
					panel = { enabled = false },
				},
			},
		},
	},
}
