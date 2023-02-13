require("config.autocommands")
require("config.diagnostics")
require("config.keymap")
require("config.pretty_help_windows")
require("config.setopts")

vim.api.nvim_command("command! WQ wq")
vim.api.nvim_command("command! Wq wq")
vim.api.nvim_command("command! W w")
vim.api.nvim_command("command! Q q")

local is_diff = false
local function toggleDiff()
	local function toggleOff()
		vim.cmd("windo diffoff")
		vim.api.nvim_win_set_option(0, "cursorbind", false)
		vim.api.nvim_win_set_option(0, "scrollbind", false)
		is_diff = false
	end

	local function toggleOn()
		vim.cmd("windo diffthis")
		vim.cmd("windo set wrap")
		vim.api.nvim_win_set_option(0, "cursorbind", true)
		vim.api.nvim_win_set_option(0, "scrollbind", true)
		is_diff = true
	end

	if is_diff then
		toggleOff()
	else
		toggleOn()
	end
end

vim.api.nvim_create_user_command("DiffToggle", function()
	toggleDiff()
end, {
	desc = "Toggle diff mode between splits",
	nargs = 0,
})
