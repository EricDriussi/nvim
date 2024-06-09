local colorizer_ft = { "css", "scss", "html", "javascript", "typescript", "typescriptreact" }

return {
	{
		"norcalli/nvim-colorizer.lua",
		ft = colorizer_ft,
		opts = colorizer_ft,
	},

	{
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
	},

	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" }, -- Removing this loads tree-sitter too soon
		config = function()
			require("illuminate").configure({
				max_file_lines = 5000,
				filetypes_denylist = { "NvimTree", "Telescope" },
			})
		end,
	},

	{
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
	},

	{
		"kevinhwang91/nvim-bqf",
		opts = {
			preview = {
				winblend = 5,
				show_scroll_bar = false,
			},
		},
	},

	{
		"seblj/nvim-tabline",
		opts = {
			modified_icon = "●",
			close_icon = "✗",
			separator = "▎",
			padding = 1,
			show_icon = false,
		},
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			max_lines = 5,
		},
	},
}
