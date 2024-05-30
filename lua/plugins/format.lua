return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {

		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofumpt" },
			markdown = { "markdownlint" },
			python = { "autopep8" },

			sh = { "shfmt", "shellharden" },
			zsh = { "shfmt", "shellharden" },

			yaml = { "yamlfmt" },

			astro = { { "prettierd", "prettier" } },

			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			javascriptreact = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
		},

		formatters = {
			autopep8 = {
				prepend_args = { "-a" },
			},
			yamlfmt = {
				prepend_args = { "-formatter", "retain_line_breaks=true,scan_folded_as_literal=true" },
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
