return {
	UI = {
		{ "lukas-reineke/indent-blankline.nvim" },
		{ "fgheng/winbar.nvim", config = require("plugins.winbar") },
		{ "nvim-lualine/lualine.nvim", config = require("plugins.lualine") },
		-- Highlight tokens
		{
			"RRethy/vim-illuminate",
			config = function()
				require("illuminate").configure({
					max_file_lines = 5000,
					filetypes_denylist = { "NvimTree", "Telescope" },
				})
			end,
		},
		-- Pretty QFList
		{ url = "https://gitlab.com/yorickpeterse/nvim-pqf.git", config = true },
		{
			"norcalli/nvim-colorizer.lua",
			config = { "css", "scss", "html", "javascript", "typescript", "typescriptreact" },
		},
		-- Theme
		{
			"sainnhe/gruvbox-material",
			init = require("plugins.misc").colorscheme,
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
		{ "ThePrimeagen/harpoon", config = { menu = { width = vim.api.nvim_win_get_width(0) - 70 } } },
		-- Telescope
		{
			"nvim-telescope/telescope.nvim",
			config = function()
				require("plugins.telescope")
			end,
			dependencies = { "notjedi/nvim-rooter.lua", config = true },
		},
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "danielfalk/smart-open.nvim", dependencies = "kkharji/sqlite.lua" },
	},

	git = {
		{ "tpope/vim-fugitive" },
		{ "lewis6991/gitsigns.nvim", config = require("plugins.gitsigns") },
		{
			"sindrets/diffview.nvim",
			cmd = { "DiffviewOpen", "DiffviewFileHistory" },
			config = function()
				require("plugins.diffview")
			end,
		},
		{ "jltwheeler/nvim-git-link", lazy = true },
	},

	parens = {
		{
			"windwp/nvim-autopairs",
			config = function()
				require("plugins.autopairs")
			end,
		},
		{ "tpope/vim-surround", init = require("plugins.misc").surround },
		{ "windwp/nvim-ts-autotag" },
		{ "p00f/nvim-ts-rainbow" },
	},

	misc = {
		-- ChatGPT
		{ "aduros/ai.vim", init = require("plugins.misc").ai, cmd = "AI" },
		-- Multi-Cursor
		{ "mg979/vim-visual-multi", init = require("plugins.misc").multi },
		-- f to char
		{ "unblevable/quick-scope", init = require("plugins.misc").quick_scope },
		-- Handle camelCase and snek_case
		{ "chaoren/vim-wordmotion" },
		-- Seek & Destroy
		{ "windwp/nvim-spectre", config = require("plugins.spectre"), lazy = true },
		{ "xorid/swap-split.nvim", cmd = "SwapSplit" },
		{ "preservim/nerdcommenter", init = require("plugins.misc").nerd_toggle },
		-- Bold, Italics, Links in MD
		{ "antonk52/markdowny.nvim" },
		{
			"iamcco/markdown-preview.nvim",
			init = require("plugins.misc").mkdp,
			build = "cd app && npm install",
		},
		{
			"akinsho/toggleterm.nvim",
			config = function()
				require("plugins.toggleterm")
			end,
		},
		{
			"folke/which-key.nvim",
			config = function()
				require("plugins.which-key")
			end,
		},
		{ "editorconfig/editorconfig-vim", init = require("plugins.misc").editorconfig },
	},

	lsp = {
		{ "neovim/nvim-lspconfig", dependencies = "williamboman/mason-lspconfig.nvim" },
		{ "williamboman/mason-lspconfig.nvim", dependencies = "williamboman/mason.nvim" },
		{ "williamboman/mason.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "b0o/SchemaStore.nvim" }, -- Needed for Jsonls
		-- Formatting and LSP like stuff for non-lsp langs
		{
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("plugins.null-ls")
			end,
		},
	},

	treesitter = {
		{ "ThePrimeagen/refactoring.nvim", config = true },
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "nvim-treesitter/nvim-treesitter-context" },
		{ "ckolkey/ts-node-action", dependencies = { "nvim-treesitter" } },
		{
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("plugins.treesitter")
			end,
			build = ":TSUpdate",
		},
	},

	cmp = {
		{
			"hrsh7th/nvim-cmp",
			config = function()
				require("plugins.completion")
			end,
			lazy = true,
		},
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-emoji" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "hrsh7th/cmp-cmdline" },
		{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
		{ "rafamadriz/friendly-snippets" },
		{ "jcdickinson/codeium.nvim", dependencies = { "MunifTanjim/nui.nvim" }, config = true },
	},
}
