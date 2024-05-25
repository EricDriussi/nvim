return {
	{
		"hrsh7th/nvim-cmp",
		config = require("plugins.completions.conf"),
		event = "InsertEnter",
		dependencies = {
			{ "onsails/lspkind.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-emoji" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{
				"saadparwaiz1/cmp_luasnip",
				dependencies = {
					{
						"L3MON4D3/LuaSnip",
						dependencies = {
							"rafamadriz/friendly-snippets",
							config = function()
								require("luasnip.loaders.from_vscode").lazy_load()
							end,
						},
					},
				},
			},
		},
	},
}
