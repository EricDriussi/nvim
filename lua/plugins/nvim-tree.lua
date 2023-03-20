return {
	disable_netrw = true,
	-- Show errors in files
	diagnostics = { enable = true },
	-- Follow open file
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
		ignore_list = { "toggleterm" },
	},
	filters = { custom = { "^\\.git" } },
	view = {
		-- Adapt size to names being shown
		adaptive_size = true,
		hide_root_folder = true,

		mappings = {
			list = {
				{ key = { "l", "<CR>", "o", "e" }, action = "edit" },
				{ key = "h",                       action = "close_node" },
				{ key = "<C-h>",                   action = "split" },
				{ key = "R",                       action = "full_rename" },
				{ key = "yf",                      action = "copy" },
				{ key = "yn",                      action = "copy_name" },
				{ key = "yp",                      action = "copy_path" },
				{ key = "?",                       action = "toggle_help" },
				{ key = "-",                       action = "" },
				{ key = "y",                       action = "" },
			},
		},
	},
}
