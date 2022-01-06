local null_ls = require("null-ls")
--local null_ls_status_ok, null_ls = pcall(require, "null-ls")
--if not null_ls_status_ok then
--return
--end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.stylua,
		formatting.eslint,

		-- CSS
		formatting.stylelint,

		-- LSP for shell sucks a bit
		formatting.shellharden,
		diagnostics.shellcheck,
	},
})
