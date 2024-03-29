return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {

		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofumpt" },
			markdown = { "markdownlint" },
			python = { "autopep8" },

			sh = { "shfmt", "shellharden", "beautysh" },
			zsh = { "beautysh" },

			yaml = { "yamlfmt" },
			yml = { "yamlfmt" },

			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			javascriptreact = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
		},

		formatters = {
			autopep8 = {
				extra_args = { "-a" },
			},
			yamlfmt = {
				extra_args = { "-formatter", "retain_line_breaks=true" },
			},
		},

		format_on_save = function()
			if vim.g.no_fos then
				return
			end
			return { lsp_fallback = true }
		end,
	},
}
