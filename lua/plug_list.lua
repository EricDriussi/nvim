return {
	UI = {
		{ "lukas-reineke/indent-blankline.nvim" },
		{
			"fgheng/winbar.nvim",
			config = require("plugins.winbar"),
		},
		{
			"nvim-lualine/lualine.nvim",
			config = require("plugins.lualine"),
		},
		-- Highlight tokens
		{
			"RRethy/vim-illuminate",
			config = require("plugins.misc").illuminate,
		},
		-- Pretty QFList
		{
			url = "https://gitlab.com/yorickpeterse/nvim-pqf.git",
			config = true,
		},
		{
			"norcalli/nvim-colorizer.lua",
			config = { "css", "scss", "html", "javascript", "typescript", "typescriptreact" },
		},
		-- Theme
		{
			"sainnhe/gruvbox-material",
			config = require("plugins.colorscheme"),
			commit = "421ccc28df2b5c8aef06b40160d539684fd1e771",
			priority = 1000,
		},
	},
	file_viewers = {
		{
			"kyazdani42/nvim-tree.lua",
			cmd = "NvimTreeToggle",
			config = require("plugins.nvim-tree"),
			dependencies = { "notjedi/nvim-rooter.lua", config = true },
		},
		{
			"ThePrimeagen/harpoon",
			config = { menu = { width = vim.api.nvim_win_get_width(0) - 70 } },
			lazy = true,
		},
		-- Telescope
		{
			"nvim-telescope/telescope.nvim",
			config = require("plugins.telescope"),
			dependencies = {
				{ "nvim-telescope/telescope-ui-select.nvim" },
				{
					"notjedi/nvim-rooter.lua",
					config = true,
				},
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					build = "make",
				},
				{
					"danielfalk/smart-open.nvim",
					dependencies = "kkharji/sqlite.lua",
				},
			},
		},
	},
	git = {
		{ "tpope/vim-fugitive" },
		{
			"lewis6991/gitsigns.nvim",
			config = require("plugins.gitsigns"),
		},
		{
			"sindrets/diffview.nvim",
			cmd = { "DiffviewOpen", "DiffviewFileHistory" },
			config = require("plugins.diffview"),
		},
		{ "jltwheeler/nvim-git-link", lazy = true },
	},
	parens = {
		{ "windwp/nvim-ts-autotag" },
		{
			"windwp/nvim-autopairs",
			config = require("plugins.autopairs"),
		},
		{
			"tpope/vim-surround",
			config = require("plugins.misc").surround,
		},
	},
	misc = {
		-- ChatGPT
		{
			"aduros/ai.vim",
			config = require("plugins.misc").ai,
			cmd = "AI",
		},
		-- Seek & Destroy
		{
			"windwp/nvim-spectre",
			config = require("plugins.spectre"),
			lazy = true,
		},
		{
			"xorid/swap-split.nvim",
			cmd = "SwapSplit",
		},
		{
			"preservim/nerdcommenter",
			config = require("plugins.misc").nerd_toggle,
		},
		{
			"akinsho/toggleterm.nvim",
			config = require("plugins.toggleterm"),
		},
		{
			"folke/which-key.nvim",
			config = require("plugins.which-key"),
		},
		{
			"editorconfig/editorconfig-vim",
			config = require("plugins.misc").editorconfig,
		},
		{
			"ThePrimeagen/refactoring.nvim",
			config = true,
			lazy = true,
		},
	},
	nav = {
		-- Handle camelCase and snek_case
		{ "chaoren/vim-wordmotion" },
		-- Multi-Cursor
		{
			"mg979/vim-visual-multi",
			config = require("plugins.misc").multi,
		},
		-- f to char
		{
			"unblevable/quick-scope",
			init = require("plugins.misc").quick_scope,
		},
		-- Open in browser
		{
			"chrishrb/gx.nvim",
			keys = { "gx" },
			config = true,
		},
	},
	md = {
		-- Bold, Italics, Links in MD
		{ "antonk52/markdowny.nvim" },
		{
			"iamcco/markdown-preview.nvim",
			config = require("plugins.misc").mkdp,
			build = "cd app && npm install",
		},
	},
	folds = {
		{
			"kevinhwang91/nvim-ufo",
			config = require("plugins.ufo"),
			dependencies = { "kevinhwang91/promise-async" },
		},
	},
	testing = {
		{
			"nvim-neotest/neotest",
			config = require("plugins.neotest"),
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
				"nvim-neotest/neotest-go",
				"nvim-neotest/neotest-plenary",
				"nvim-neotest/neotest-python",
				"haydenmeade/neotest-jest",
			},
			lazy = true,
		},
	},
	lsp = {
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				"williamboman/mason-lspconfig.nvim",
				dependencies = "williamboman/mason.nvim",
			},
		},
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		-- Formatting and LSP like stuff for non-lsp langs
		{
			"jose-elias-alvarez/null-ls.nvim",
			config = require("plugins.null-ls"),
		},
		{ "b0o/SchemaStore.nvim" }, -- Needed for Jsonls
	},
	treesitter = {
		{ "nvim-treesitter/nvim-treesitter-context" },
		{
			"ckolkey/ts-node-action",
			dependencies = { "nvim-treesitter" },
		},
		{
			"nvim-treesitter/nvim-treesitter",
			config = require("plugins.treesitter"),
			build = ":TSUpdate",
			dependencies = {
				"HiPhish/nvim-ts-rainbow2",
				"nvim-treesitter/nvim-treesitter-textobjects",
			},
		},
	},
	cmp = {
		{
			"hrsh7th/nvim-cmp",
			config = require("plugins.completion"),
			lazy = true,
			dependencies = {
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "hrsh7th/cmp-cmdline" },
				{ "hrsh7th/cmp-emoji" },
				{ "hrsh7th/cmp-nvim-lsp-signature-help" },
				{
					"saadparwaiz1/cmp_luasnip",
					dependencies = {
						"L3MON4D3/LuaSnip",
						dependencies = { "rafamadriz/friendly-snippets" },
					},
				},
				{
					"jcdickinson/codeium.nvim",
					dependencies = { "MunifTanjim/nui.nvim" },
					config = true,
				},
				{
					"zbirenbaum/copilot-cmp",
					dependencies = { "zbirenbaum/copilot.lua", config = true },
					config = {
						suggestion = { enabled = false },
						panel = { enabled = false },
					},
				},
			},
		},
	},
}
