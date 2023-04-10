return function()
	vim.g.gruvbox_material_background = "medium"
	vim.g.gruvbox_material_foreground = "mix"
	vim.g.gruvbox_material_better_performance = 1
	vim.g.gruvbox_material_enable_italic = 1
	vim.g.gruvbox_material_current_word = "bold,italic"
	vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
	vim.g.gruvbox_material_menu_selection_background = "blue"
	vim.opt.background = "dark"
	vim.api.nvim_command("colorscheme gruvbox-material")
	-- Override for cmp popup
	vim.api.nvim_set_hl(0, "Pmenu", { bg = "#282828" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#282828", fg = "#928374" })
	-- Override for whichkey popup
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282828" })
end
