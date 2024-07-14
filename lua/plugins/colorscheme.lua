return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_background = "medium"
		vim.g.gruvbox_material_foreground = "mix"
		vim.g.gruvbox_material_better_performance = 1
		vim.g.gruvbox_material_enable_italic = 1
		vim.g.gruvbox_material_current_word = "bold,italic"
		vim.g.gruvbox_material_diagnostic_virtual_text = "colored"

		vim.api.nvim_command("colorscheme gruvbox-material")
		local border_color = "#928374"
		vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = border_color })
		vim.api.nvim_set_hl(0, "WhichKeyFloat", vim.api.nvim_get_hl_by_name("Normal", true))
		vim.api.nvim_set_hl(0, "BqfPreviewBorder", { fg = border_color, ctermfg = 71 })
		vim.api.nvim_set_hl(0, "BqfPreviewTitle", { fg = border_color, ctermfg = 71 })
		vim.api.nvim_set_hl(0, "SpellCap", vim.api.nvim_get_hl_by_name("DiagnosticUnderlineInfo", true))
		vim.api.nvim_set_hl(0, "SpellBad", vim.api.nvim_get_hl_by_name("DiagnosticUnderlineInfo", true))
	end,
}
