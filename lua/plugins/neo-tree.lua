local project_name_as_root_dir = function()
	-- https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/681#discussioncomment-5429393
	return function(config, node, state)
		local result = require("neo-tree.sources.filesystem.components").name(config, node, state)
		if node:get_depth() == 1 and node.type ~= "message" then
			result.text = vim.fn.fnamemodify(node.path, ":t")
		end
		return result
	end
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		{
			-- Needed to ctrl+v / ctrl+h
			"s1n7ax/nvim-window-picker",
			event = "VeryLazy",
			version = "2.*",
			opts = {
				show_prompt = false,
				selection_chars = "ABCDEFGHIJKL",
			},
		},
	},

	opts = {
		close_if_last_window = true,
		default_component_configs = {
			diagnostics = {
				symbols = {
					error = "",
					warn = "",
					info = "",
					hint = "",
				},
			},
			indent = {
				with_expanders = true,
			},
			modified = {
				symbol = "",
			},
			git_status = {
				symbols = {
					untracked = "",
					ignored = "",
					unstaged = "",
					staged = "",
					conflict = "",
				},
			},
		},

		event_handlers = {
			{
				event = "after_render",
				handler = function()
					vim.api.nvim_set_hl(0, "NeoTreeNormal", vim.api.nvim_get_hl_by_name("Normal", true))
					vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", vim.api.nvim_get_hl_by_name("Normal", true))
				end,
			},
		},

		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
			},
			use_libuv_file_watcher = true,
			group_empty_dirs = true,
			components = {
				name = project_name_as_root_dir(),
			},
		},

		window = {
			width = 30,
			mappings = {
				["<space>"] = "",
				["<c-t>"] = "open_tabnew",
				["<c-h>"] = "split_with_window_picker",
				["<c-v>"] = "vsplit_with_window_picker",
				["l"] = "open_with_window_picker",
				["h"] = "close_node",
				["<cr>"] = "open_with_window_picker",
				["/"] = "",
				["y"] = "",
				["yy"] = "copy_to_clipboard",
				["yp"] = function(state)
					local node = state.tree:get_node()
					local filepath = node:get_id()
					local rel_filepath = vim.fn.fnamemodify(filepath, ":.")
					vim.fn.setreg("+", rel_filepath)
					print('Copied "' .. rel_filepath .. '" to system clipboard')
				end,
				["yn"] = function(state)
					local file = state.tree:get_node()
					vim.fn.setreg("+", file.name)
					print('Copied "' .. file.name .. '" to system clipboard')
				end,
			},
		},
	},
}
