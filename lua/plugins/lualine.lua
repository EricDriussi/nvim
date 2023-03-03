local function readingTime()
	local isMarkdown = vim.bo.filetype == "markdown"
	if isMarkdown then
		return string.format("%s 🕐", math.ceil(vim.fn.wordcount().words / 250))
	end
	return ""
end

return {
	options = {
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		theme = "gruvbox-material",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "diagnostics" },
		lualine_x = { "fileformat", readingTime, "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
}
