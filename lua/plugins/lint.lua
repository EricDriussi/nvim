local events = { "BufRead", "BufNewFile", "VimEnter", "BufWritePost" }
return {
	"mfussenegger/nvim-lint",
	event = events,
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			markdown = { "markdownlint" },
			yml = { "ansible_lint" },
			yaml = { "ansible_lint" },
			zsh = { "zsh" },
		}

		vim.api.nvim_create_autocmd(events, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
