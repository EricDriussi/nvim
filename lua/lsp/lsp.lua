-- Define custom LSP settings
local lsp_settings = {
	on_attach = function(client)
		-- Use null-ls for formatting
		if client.name == "pylsp" then
			client.server_capabilities.documentFormattingProvider = false
		end
		-- Use null-ls for formatting
		if client.name == "tsserver" then
			client.server_capabilities.documentFormattingProvider = false
		end
	end,

	-- Add LSP capabilities to cmp
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

-- Add custom LSP settings to default ones
local lspconfig = require("lspconfig")
lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, lsp_settings)

-- Let mason-lspconfig handle servers handlers based on installed ones
local custom_settings = require("lsp.lang_settings")
require("mason-lspconfig").setup_handlers({
	function(server_name)
		local lspconfig_and_custom_settings = vim.tbl_deep_extend(
			"force",
			-- Add custom language settings to lspconfig
			custom_settings.get_settings_for(server_name),
			lsp_settings
		)
		-- Ensure all installed servers are available on startup
		lspconfig[server_name].setup(lspconfig_and_custom_settings)
	end,
})
