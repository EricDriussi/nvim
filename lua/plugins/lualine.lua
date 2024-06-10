local function readingTime()
	if vim.bo.filetype ~= "markdown" then
		return ""
	end

	local wordsInBuff = vim.fn.wordcount().words
	local avgReadingSpeed = 250
	local time = math.ceil(wordsInBuff / avgReadingSpeed)
	return string.format("%s 🕐", time)
end

local function path_from_root()
	local bufname = vim.api.nvim_buf_get_name(0)
	local root = vim.fs.root(0, { ".git" }) or vim.fn.expand("%:p:h")

	local rel_path = string.gsub(bufname, "^" .. root .. "/", "")
	local rel_path_no_ext = string.gsub(rel_path, "([^/]+)%.([^%.]*)$", "%1")

	local pretty_output = string.gsub(rel_path_no_ext, "/", " > ")
	return pretty_output
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
			theme = "gruvbox-material",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = { "diagnostics", path_from_root },
			lualine_x = { "fileformat", readingTime, "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
