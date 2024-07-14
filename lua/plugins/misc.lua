local M = {}

M.swap = {
	"xorid/swap-split.nvim",
	cmd = "SwapSplit",
	opts = {
		ignore_filetypes = {
			"neo-tree",
		},
	},
}

M.comment = {
	{
		"terrortylor/nvim-comment",
		cmd = "CommentToggle",
		config = function()
			require("nvim_comment").setup({
				create_mappings = false,
				comment_empty = false,
			})
		end,
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
}

M.md = {
	{ "antonk52/markdowny.nvim", ft = "markdown" }, -- Bold, Italics, Links, Code
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = "cd app && npm install",
		config = function()
			vim.g.mkdp_port = "6969"
		end,
	},
}

M.ia = {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	opts = {
		panel = { enalbed = false },
		suggestion = {
			auto_trigger = true,
		},
	},
}

M.cursorHold = {
	"antoinemadec/FixCursorHold.nvim",
	config = function()
		vim.g.cursorhold_updatetime = 100
	end,
}

M.db = {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.dbs = { dev = "postgres://USER:PWD@IP:PORT/DB" }
	end,
}

M.curl = {
	"oysandvik94/curl.nvim",
	cmd = { "CurlOpen" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = true,
}

M.git = {
	{
		"tpope/vim-fugitive",
		dependencies = {
			"tpope/vim-rhubarb",
			"shumphrey/fugitive-gitlab.vim",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = " ▎" },
				change = { text = " ▎" },
				delete = { text = " ▎" },
				topdelete = { text = " ▎" },
				changedelete = { text = " ▎" },
				untracked = { text = " ┆" },
			},
		},
	},
}

return M
