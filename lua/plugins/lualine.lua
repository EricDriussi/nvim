local function readingTime()
	local isMarkdown = vim.bo.filetype == "markdown"
	if isMarkdown then
		local wordsInBuff = vim.fn.wordcount().words
		local avgReadingSpeed = 250
		local time = math.ceil(wordsInBuff / avgReadingSpeed)
		return string.format("%s 🕐", time)
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
		lualine_c = { "diagnostics", "filename" },
		lualine_x = { "fileformat", readingTime, "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
}
