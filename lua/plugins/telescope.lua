return function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")

	local custom_ivy = {
		theme = "ivy",
		layout_config = { height = 0.35 },
		on_complete = {
			function()
				vim.cmd("stopinsert")
			end,
		},
	}

	telescope.setup({
		defaults = {
			file_ignore_patterns = { "node_modules" },
			prompt_prefix = "🔎 ",
			selection_caret = " ⮚ ",
			path_display = { "shortest" },
			sorting_strategy = "ascending",
			layout_config = {
				prompt_position = "top",
				width = 0.90,
			},

			-- Extend default grep args!
			vimgrep_arguments = vim.tbl_deep_extend(
				"force",
				{ unpack(require("telescope.config").values.vimgrep_arguments) },
				{ "rg", "--hidden", "--glob", "!.git/*" }
			),

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
				on_complete = {
					function()
						vim.cmd("stopinsert")
					end,
				},
			},
			find_files = { find_command = { "rg", "--hidden", "--files", "--glob", "!.git" } },
			lsp_definitions = custom_ivy,
			lsp_implementations = custom_ivy,
			lsp_references = custom_ivy,
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
			["ui-select"] = {
				layout_strategy = "cursor",
				layout_config = { width = 0.4, height = 0.3 },
				on_complete = {
					function()
						vim.cmd("stopinsert")
					end,
				},
			},
		},
	})

	telescope.load_extension("fzf")
	telescope.load_extension("ui-select")
	telescope.load_extension("smart_open")
	telescope.load_extension("refactoring")
end
