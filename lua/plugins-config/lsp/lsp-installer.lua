local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("plugins-config.lsp.handlers").on_attach,
		capabilities = require("plugins-config.lsp.handlers").capabilities,
	}

-- Only add settings here if settings file is needed.
-- Defaults don't require the following setup
	 if server.name == "jsonls" then
	 	local jsonls_opts = require("plugins-config.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("plugins-config.lsp.settings.sumneko-lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	 if server.name == "eslint" then
	 	local eslint_opts = require("plugins-config.lsp.settings.eslint")
	 	opts = vim.tbl_deep_extend("force", eslint_opts, opts)
	 end

   -- just a sample for how to change root dir
	 if server.name == "zk" then
	 	local zk_opts = require("plugins-config.lsp.settings.zk")
	 	opts = vim.tbl_deep_extend("force", zk_opts, opts)
	 end

	server:setup(opts)
end)

