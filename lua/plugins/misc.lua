local M = {}

M.indent_scope = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local hooks = require("ibl.hooks")
		-- Skip first indent level
		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
		require("ibl").setup()
		vim.cmd.highlight("clear @ibl.scope.underline.1") -- Remove underline for scope start
	end,
}

M.illuminate = {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" }, -- Removing this loads tree-sitter too soon
	config = function()
		require("illuminate").configure({
			max_file_lines = 5000,
			filetypes_denylist = { "NvimTree", "Telescope" },
		})
	end,
}

local colorizer_ft = { "css", "scss", "html", "javascript", "typescript", "typescriptreact" }
M.colorizer = {
	"norcalli/nvim-colorizer.lua",
	ft = colorizer_ft,
	opts = colorizer_ft,
}

M.statuscol = {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			relculright = true,
			segments = {
				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
				{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
				{ sign = { namespace = { "gitsigns" } }, click = "v:lua.ScSa" },
			},
		})
	end,
}

M.swap = {
	"xorid/swap-split.nvim",
	cmd = "SwapSplit",
	opts = {
		ignore_filetypes = {
			"neo-tree",
		},
	},
}

M.quickfix = {
	"kevinhwang91/nvim-bqf",
	opts = {
		preview = {
			winblend = 5,
			show_scroll_bar = false,
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

M.harpoon = {
	"ThePrimeagen/harpoon",
	opts = { menu = { width = vim.api.nvim_win_get_width(0) - 70 } },
	lazy = true,
}

M.multicursor = {
	"mg979/vim-visual-multi",
	config = function()
		-- MultiCursor behave like intelliJ
		vim.api.nvim_exec([[ let g:VM_custom_remaps = {'N': 'Q'} ]], false)
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
	keys = { "gx" },
	config = true,
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

M.tabline = {
	"seblj/nvim-tabline",
	config = {
		modified_icon = "●",
		close_icon = "✗",
		separator = "▎",
		padding = 1,
		show_icon = false,
	},
}

M.cursorHold = {
	"antoinemadec/FixCursorHold.nvim",
	config = function()
		vim.g.cursorhold_updatetime = 100
	end,
}

return M
