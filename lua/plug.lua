local UI = {
	require("plugins.UI"),
	require("plugins.parens"),
	require("plugins.colorscheme"),
	require("plugins.lualine"),
	require("plugins.winbar"),
	require("plugins.folds"),
	{ "tpope/vim-sleuth" },
}

local misc = {
	require("plugins.misc").rooter,
	require("plugins.spectre"), -- Seek & Destroy
	require("plugins.misc").swap,
	require("plugins.misc").comment,
	require("plugins.whichkey"),
	require("plugins.misc").ia,
	require("plugins.misc").cursorHold, -- Decouple updatetime from CursorHold
	require("plugins.misc").db,
	require("plugins.misc").spelling,
}

local file_viewers = {
	require("plugins.neotree"),
	require("plugins.telescope"),
}

local git = {
	{
		"tpope/vim-fugitive",
		dependencies = {
			"tpope/vim-rhubarb",
			"shumphrey/fugitive-gitlab.vim",
		},
	},
	require("plugins.gitsigns"),
	require("plugins.diffview"),
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
	require("plugins.format"),
	require("plugins.lint"),

	UI,
	misc,
	file_viewers,
	git,
	nav,
	md,

	{ "EricDriussi/remember-me.nvim", config = true },
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
