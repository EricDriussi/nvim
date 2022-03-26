local null_ls = require("null-ls")
--local null_ls_status_ok, null_ls = pcall(require, "null-ls")
--if not null_ls_status_ok then
--return
--end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions
null_ls.setup({
	debug = false,
	sources = {
		formatting.stylua.with({
                    timeout = 10000
                }),
		formatting.eslint.with({
                    timeout = 10000
                }),

		--diagnostics.eslint,
                diagnostics.yamllint,

		-- CSS
		formatting.stylelint,
		diagnostics.stylelint,

		-- LSP for shell sucks a bit
		formatting.shellharden,
		diagnostics.shellcheck,
                actions.shellcheck,

	},
})
