local plug = require("plug_list")
local plugins = {
	-- Needed for other plugins
	{ "nvim-lua/popup.nvim",          priority = 1000 },
	{ "nvim-lua/plenary.nvim",        priority = 1000 },
	{ "kyazdani42/nvim-web-devicons", priority = 1000 },
	plug.UI,
	plug.file_viewers,
	plug.git,
	plug.parens,
	plug.misc,
	plug.nav,
	plug.md,
	plug.folds,
	plug.lsp,
	plug.treesitter,
	plug.cmp,
	{ "EricDriussi/aucmd-toggle.nvim" },
	{ "EricDriussi/remember-me.nvim", config = true },

	{
		"glacambre/firenvim", -- from https://github.com/glacambre/firenvim#installing
		cond = not not vim.g.started_by_firenvim,
		build = function()
			require("lazy").load({ plugins = "firenvim", wait = true })
			vim.fn["firenvim#install"](0)
		end,
		init = function()
			vim.g.firenvim_config = {
				localSettings = {
					[".*"] = { takeover = "never" },
					[".*github.*"] = { takeover = "always" },
					[".*gitlab.*"] = { takeover = "always" },
				},
			}
		end,
	},
}

local setup = {
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
}

require("lazy").setup(plugins, setup)
