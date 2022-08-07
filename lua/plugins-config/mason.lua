local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end
local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end
local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    },
    keymaps = {
      uninstall_package = "d",
    },
    max_concurrent_installers = 4,
  }
})

mason_lspconfig.setup {
  ensure_installed = {
    "cssls",
    "emmet_ls",
    "html",
    "jsonls",
    "sumneko_lua",
    "tsserver",
    "pyright",
    "yamlls",
    "bashls",
    "sumneko_lua"
  },
  automatic_installation = true,
}

local function get_custom_settings(server_name)
  if server_name == "sumneko_lua" then
    return require("plugins-config.lang-settings.sumneko-lua")

  elseif server_name == "jsonls" then
    return require("plugins-config.lang-settings.jsonls")

  elseif server_name == "eslint" then
    return require("plugins-config.lang-settings.eslint")

  elseif server_name == "zk" then
    return require("plugins-config.lang-settings.zk")

  else
    return {}
  end

end

local lspconfig_settings = {
  on_attach = require("plugins-config.core.lsp").on_attach,
  capabilities = require("plugins-config.core.lsp").capabilities,
}
mason_lspconfig.setup_handlers({
  function(server_name)
    -- Add custom settings to lspconfig
    local lspconfig_and_custom_settings = vim.tbl_deep_extend("force",
      get_custom_settings(server_name),
      lspconfig_settings)

    -- Ensure all available servers are attached on startup
    lspconfig[server_name].setup(lspconfig_and_custom_settings)
  end,
})
