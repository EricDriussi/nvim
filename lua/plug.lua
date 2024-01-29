local col_line_bar = {
	require("plugins.misc").statuscol,
	require("plugins.lualine"),
	require("plugins.winbar"),
	require("plugins.folds"),
}

local UI = {
	col_line_bar,
	require("plugins.misc").indent_scope,
	require("plugins.misc").illuminate,
	require("plugins.misc").quickfix,
	require("plugins.misc").colorizer,
	require("plugins.parens"),
	require("plugins.colorscheme"),
	require("plugins.misc").tabline,
}

local misc = {
	require("plugins.misc").rooter,
	require("plugins.spectre"), -- Seek & Destroy
	require("plugins.misc").swap,
	require("plugins.misc").comment,
	require("plugins.toggleterm"),
	require("plugins.whichkey"),
	require("plugins.ia"),
	require("plugins.misc").cursorHold, -- Decouple updatetime from CursorHold
}

local file_viewers = {
	require("plugins.neotree"),
	require("plugins.misc").harpoon,
	require("plugins.telescope"),
}

local git = {
	{ "tpope/vim-fugitive", cmd = { "Git" } },
	require("plugins.gitsigns"),
	require("plugins.diffview"),
	{ "jltwheeler/nvim-git-link", lazy = true },
}

local nav = {
	{ "chaoren/vim-wordmotion" }, -- Handle camelCase and snek_case
	require("plugins.misc").multicursor,
	require("plugins.misc").quick_scope, -- f to char
	require("plugins.misc").open_links,
}

local md = {
	{ "antonk52/markdowny.nvim", ft = "markdown" }, -- Bold, Italics, Links, Code
	require("plugins.misc").md_preview,
}

local plugin_list = {
	require("plugins.completions"),
	require("plugins.treesitter"),
	require("plugins.testing"),
	require("plugins.lsp"),
	require("plugins.none"),

	UI,
	misc,
	file_viewers,
	git,
	nav,
	md,

	{ "EricDriussi/aucmd-toggle.nvim" },
	{ "EricDriussi/remember-me.nvim", config = true },
	{ "tpope/vim-sleuth" },
}

local setup = {
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
}

require("lazy").setup(plugin_list, setup)
