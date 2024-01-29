local custom_ivy = {
	theme = "ivy",
	layout_config = { height = 0.35 },
	initial_mode = "normal",
}

local no_prev_dropdown = { theme = "dropdown", previewer = false }

return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"danielfalk/smart-open.nvim",
			dependencies = {
				"kkharji/sqlite.lua",
				{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			},
		},
	},

	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				prompt_prefix = "🔎 ",
				selection_caret = " ⮚ ",
				path_display = { "smart" },
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
					width = 0.90,
				},

				mappings = {
					i = {
						["<C-i>"] = actions.cycle_history_next,
						["<C-o>"] = actions.cycle_history_prev,
						["<Esc>"] = actions.close,
						["<C-w>"] = actions.close,
						["<C-q>"] = actions.close,
						["<C-h>"] = actions.select_horizontal,
						["<Tab>"] = actions.move_selection_next,
						["<S-Tab>"] = actions.move_selection_previous,
						["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
					},

					n = {
						["<C-w>"] = actions.close,
						["<C-q>"] = actions.close,
						["<C-h>"] = actions.select_horizontal,
						["<Tab>"] = actions.move_selection_next,
						["<S-Tab>"] = actions.move_selection_previous,
						["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
					},
				},
			},

			pickers = {
				spell_suggest = {
					theme = "cursor",
					layout_config = { width = 0.25 },
					initial_mode = "normal",
				},
				lsp_definitions = custom_ivy,
				lsp_implementations = custom_ivy,
				lsp_references = custom_ivy,
				commands = no_prev_dropdown,
				registers = no_prev_dropdown,
				git_branches = no_prev_dropdown,
			},

			extensions = {
				["ui-select"] = {
					layout_strategy = "cursor",
					layout_config = { width = 0.4, height = 0.3 },
					initial_mode = "normal",
				},
				smart_open = {
					match_algorithm = "fzf",
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("smart_open")
	end,
}
