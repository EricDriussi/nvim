return function()
	vim.g.gruvbox_material_background = "medium"
	vim.g.gruvbox_material_foreground = "mix"
	vim.g.gruvbox_material_better_performance = 1
	vim.g.gruvbox_material_enable_italic = 1
	vim.g.gruvbox_material_current_word = "bold,italic"
	vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
	vim.opt.background = "dark"
	vim.api.nvim_command("colorscheme gruvbox-material")
end
