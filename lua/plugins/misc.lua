local M = {}

M.indentscope = {
	"echasnovski/mini.indentscope",
	opts = {
		symbol = "│",
		options = { try_as_border = true },
	},
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

M.comment = {
	"terrortylor/nvim-comment",
	cmd = "CommentToggle",
	config = function()
		require("nvim_comment").setup({
			create_mappings = false,
			comment_empty = false,
		})
	end,
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

return M
