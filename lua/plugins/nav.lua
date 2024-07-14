return {
	{ "chaoren/vim-wordmotion" }, -- Handle camelCase and snek_case
	{
		"mg979/vim-visual-multi",
		config = function()
			-- MultiCursor behave like intelliJ
			vim.g.VM_custom_remaps = { N = "Q" }
		end,
	},
	{
		"unblevable/quick-scope",
		init = function()
			-- Quickscope only highlight on keys
			vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
		end,
	},
	{
		-- Open links in browser
		"chrishrb/gx.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Browse" },
		opts = {
			handler_options = {
				search_engine = "duckduckgo",
			},
		},
	},
}
