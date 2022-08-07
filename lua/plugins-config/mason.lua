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

require 'mason-tool-installer'.setup {
  ensure_installed = {
    "css-lsp",
    "emmet-ls",
    "html-lsp",
    "typescript-language-server",
    "eslint_d",

    "yaml-language-server",
    "yamllint",

    "bash-language-server",
    "shellcheck",
    "shfmt",

    "ltex-ls",
    "markdownlint",
    "marksman",

    "json-lsp",
    "lua-language-server",
    "python-lsp-server",
  },
}
mason_lspconfig.setup {
  automatic_installation = true,
}

local function get_custom_settings(lspconfig_server_name)
  if lspconfig_server_name == "sumneko_lua" then
    return require("plugins-config.lang-settings.sumneko-lua")

  elseif lspconfig_server_name == "jsonls" then
    return require("plugins-config.lang-settings.jsonls")

  elseif lspconfig_server_name == "eslint" then
    return require("plugins-config.lang-settings.eslint")

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
