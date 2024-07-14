local UI = {
	require("plugins.UI"),
	require("plugins.parens"),
	require("plugins.colorscheme"),
	require("plugins.lualine"),
	require("plugins.folds"),
	{ "tpope/vim-sleuth" },
}

local misc = {
	require("plugins.spectre"), -- Seek & Destroy
	require("plugins.misc").swap,
	require("plugins.misc").comment,
	require("plugins.whichkey"),
	require("plugins.misc").ia,
	require("plugins.misc").cursorHold, -- Decouple updatetime from CursorHold
	require("plugins.misc").db,
	require("plugins.misc").curl,
}

local file_viewers = {
	require("plugins.neotree"),
	require("plugins.telescope"),
}

local git = {
	require("plugins.misc").git,
	require("plugins.diffview"),
}

local plugin_list = {
	require("plugins.completions"),
	require("plugins.treesitter"),
	require("plugins.testing"),
	require("plugins.lsp"),
	require("plugins.format"),
	require("plugins.lint"),
	require("plugins.nav"),
	require("plugins.misc").md,

	UI,
	misc,
	file_viewers,
	git,

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
