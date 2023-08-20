return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			dependencies = {
				{
					"williamboman/mason.nvim",
					opts = require("plugins.lsp.mason").mason,
				},
				"b0o/SchemaStore.nvim",
				"hrsh7th/cmp-nvim-lsp",
			},
			opts = require("plugins.lsp.mason").lspmason,
		},
	},
	{
		-- Handle all mason tools, not only lsp clients
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "williamboman/mason.nvim" },
		opts = require("plugins.lsp.mason").installer,
	},
}
