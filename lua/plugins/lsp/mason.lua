return {
	mason = {
		ui = {
			keymaps = {
				uninstall_package = "d",
			},
			max_concurrent_installers = 6,
		},
	},

	lspmason = {
		handlers = {
			-- Applies for all langs
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					settings = require("plugins.lsp.lang_settings")[server_name],
				})
			end,

			-- Override for lua_ls, turn off semanticTokens
			["lua_ls"] = function()
				require("lspconfig").lua_ls.setup({
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					settings = require("plugins.lsp.lang_settings")["lua_ls"],
					on_attach = function(client)
						client.server_capabilities.semanticTokensProvider = nil
					end,
				})
			end,

			-- Override for tsserver, format with null-ls
			["tsserver"] = function()
				require("lspconfig").tsserver.setup({
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					settings = require("plugins.lsp.lang_settings")["tsserver"],
					on_attach = function(client)
						client.server_capabilities.documentFormattingProvider = false
					end,
				})
			end,

			-- Override for pylsp, format with null-ls
			["pylsp"] = function()
				require("lspconfig").pylsp.setup({
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					settings = require("plugins.lsp.lang_settings")["pylsp"],
					on_attach = function(client)
						client.server_capabilities.documentFormattingProvider = false
					end,
				})
			end,
		}
	},

	installer = {
		ensure_installed = {
			"actionlint",
			"ansible-language-server",
			"autopep8",
			"bash-language-server",
			"css-lsp",
			"emmet-ls",
			"eslint-lsp",
			"eslint_d",
			"gofumpt",
			"gopls",
			"html-lsp",
			"json-lsp",
			"ltex-ls",
			"lua-language-server",
			"markdownlint",
			"marksman",
			"mypy",
			"python-lsp-server",
			"rust-analyzer",
			"rustfmt",
			"shellcheck",
			"shfmt",
			"stylua",
			"typescript-language-server",
			"yaml-language-server",
			"yamlfmt",
			"yamllint",
		},
	},
}
