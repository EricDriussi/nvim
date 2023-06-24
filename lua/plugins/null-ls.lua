return function()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local actions = null_ls.builtins.code_actions

	null_ls.setup({
		debug = false,
		sources = {

			formatting.stylua,
			formatting.gofumpt,
			formatting.yamlfmt,
			formatting.prettierd.with({
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			}),

			formatting.markdownlint,
			diagnostics.markdownlint.with({
				extra_args = { "--disable", "MD029", "MD013", "MD041", "MD024", "MD025", "MD047" },
			}),

			formatting.autopep8.with({
				extra_args = { "-a" },
			}),
			diagnostics.mypy.with({
				extra_args = { "--config-file", vim.fn.getcwd() .. "/setup.cfg" },
			}),

			actions.shellcheck,
			formatting.shfmt,

			diagnostics.zsh,
			formatting.beautysh.with({
				filetypes = { "zsh" },
			}),
		},
	})

	null_ls.register({
		name = "more_actions",
		method = { require("null-ls").methods.CODE_ACTION },
		filetypes = { "_all" },
		generator = {
			fn = require("ts-node-action").available_actions,
		},
	})
end
