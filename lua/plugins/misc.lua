local M = {}
local g = vim.g
local map = vim.api.nvim_set_keymap

M.colorscheme = function()
	g.gruvbox_material_background = "medium"
	g.gruvbox_material_foreground = "mix"
	g.gruvbox_material_better_performance = 1
	g.gruvbox_material_enable_italic = 1
	g.gruvbox_material_current_word = "bold,italic"
	g.gruvbox_material_diagnostic_virtual_text = "colored"
	vim.opt.background = "dark"
	vim.api.nvim_command("colorscheme gruvbox-material")
end

M.editorconfig = function()
	-- Thing between editorconfig and fugitive
	g.EditorConfig_exclude_patterns = { "fugitive://.*" }
end

M.nerd_toggle = function()
	-- Better comment toggle for code blocks
	g.NERDToggleCheckAllLines = 1
end

M.mkdp = function()
	-- MD preview port
	g.mkdp_port = "6969"
end

M.surround = function()
	map("v", "(", "S)", {})
	map("v", "[", "S]", {})
	map("v", "{", "S}", {})
	map("v", "'", "S'", {})
	map("v", '"', 'S"', {})
	map("v", "`", "S`", {})
end

M.multi = function()
	-- MultiCursor behave like intelliJ
	vim.api.nvim_exec([[ let g:VM_custom_remaps = {'N': 'Q'} ]], false)
end

M.ai = function()
	-- Remove <C-a> map
	g.ai_no_mappings = 1
end

M.quick_scope = function()
	-- Quickscope only highlight on keys
	g.qs_highlight_on_keys = { "f", "F", "t", "T" }
end

M.illuminate = function()
	require("illuminate").configure({
		max_file_lines = 5000,
		filetypes_denylist = { "NvimTree", "Telescope" },
	})
end

return M
