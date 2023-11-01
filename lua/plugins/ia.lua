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
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		opts = {
			panel = { enalbed = false },
			suggestion = {
				auto_trigger = true,
			},
		},
	},
}
