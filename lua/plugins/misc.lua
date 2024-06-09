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

M.multicursor = {
	"mg979/vim-visual-multi",
	config = function()
		-- MultiCursor behave like intelliJ
		vim.g.VM_custom_remaps = { N = "Q" }
	end,
}

M.quick_scope = {
	"unblevable/quick-scope",
	init = function()
		-- Quickscope only highlight on keys
		vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
	end,
}

M.open_links = {
	"chrishrb/gx.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "Browse" },
	opts = {
		handler_options = {
			search_engine = "duckduckgo",
		},
	},
}

M.md_preview = {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	build = "cd app && npm install",
	config = function()
		vim.g.mkdp_port = "6969"
	end,
}

M.rooter = {
	-- Root for explorer and tabs
	"notjedi/nvim-rooter.lua",
	priority = 1000,
	config = true,
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

return M
