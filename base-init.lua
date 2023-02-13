require("config")

-- DIY statusline
local function full_file_name()
	local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
	local fname = vim.fn.expand("%:t")
	if fpath == "" or fpath == "." then
		return " " .. fname .. " "
	end
	return string.format(" %%<%s/", fpath) .. fname .. " "
end

local modes = {
	["n"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "V LINE",
	[""] = "V BLOCK",
	["i"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "V REPLACE",
	["c"] = "COMMAND",
	["r"] = "PROMPT",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}

local function mode_name()
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format(" %s ", modes[current_mode]):upper()
end

vim.api.nvim_set_hl(0, "vis", { fg = "#000000", bg = "#F4905C", bold = true })
vim.api.nvim_set_hl(0, "nor", { fg = "#112605", bg = "#aefe7B", bold = true })
vim.api.nvim_set_hl(0, "ins", { fg = "#ffffff", bg = "#5b7fbb", bold = true })
vim.api.nvim_set_hl(0, "com", { fg = "#ffffff", bg = "#810085", bold = true })
vim.api.nvim_set_hl(0, "rep", { fg = "#ffffff", bg = "#880c0e", bold = true })

local function mode_color()
	local current_mode = vim.api.nvim_get_mode().mode
	local mode_color = ""
	if current_mode == "n" then
		mode_color = "%#nor#"
	elseif current_mode == "i" then
		mode_color = "%#ins#"
	elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
		mode_color = "%#vis#"
	elseif current_mode == "R" or current_mode == "Rv" then
		mode_color = "%#rep#"
	elseif current_mode == "c" then
		mode_color = "%#com#"
	else
		mode_color = "%#nor#"
	end
	return mode_color
end

local function git_branch()
	local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
	if branch == "" then
		return ""
	else
		return "  " .. branch .. " "
	end
end

local function custom_status()
	return table.concat({
		"%#Statusline#",
		mode_color(),
		mode_name(),
		"%#colorcolumn#",
		git_branch(),
		"%#StatusLineExtra#",
		full_file_name(),
		"%=",
		string.format(" %s ", vim.bo.filetype),
		"%#colorcolumn#",
		" %P %l:%c ",
	})
end

vim.opt.statusline = custom_status()
