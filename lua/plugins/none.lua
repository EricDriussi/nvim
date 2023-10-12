return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "ckolkey/ts-node-action" },
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local actions = null_ls.builtins.code_actions

		null_ls.setup({
			fallback_severity = vim.diagnostic.severity.WARN,
			sources = {

				formatting.stylua,
				formatting.gofumpt,
				formatting.yamlfmt,
				formatting.prettierd.with({
					filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				}),

				formatting.markdownlint,
				diagnostics.markdownlint,

				formatting.autopep8.with({
					extra_args = { "-a" },
				}),
				diagnostics.mypy.with({
					extra_args = function()
						local virtual = os.getenv("VIRTUAL_ENV") or "/usr"
						local flags = {
							"--python-executable",
							virtual .. "/bin/python3",
						}

						local local_cfg = vim.fn.getcwd() .. "/setup.cfg"
						local file = io.open(local_cfg, "r")
						if file ~= nil then
							io.close(file)
							table.insert(flags, 1, "--config-file")
							table.insert(flags, 2, local_cfg)
							return flags
						end
						return flags
					end,
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
	end,
}
