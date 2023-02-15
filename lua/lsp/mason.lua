require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
		keymaps = {
			uninstall_package = "d",
		},
		max_concurrent_installers = 4,
	},
})

require("mason-lspconfig").setup({
	automatic_installation = true,
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"css-lsp",
		"emmet-ls",
		"html-lsp",
		"typescript-language-server",
		"eslint-lsp",
		"eslint_d",

		"yaml-language-server",

		"bash-language-server",
		"shellcheck",
		"shfmt",

		"ltex-ls",
		"markdownlint",

		"lua-language-server",
		"stylua",

		"python-lsp-server",
		"autopep8",

		"gopls",
		"gofumpt",

		"json-lsp",
	},
})
