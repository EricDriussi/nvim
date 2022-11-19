local Module = {}
-- Fetch custom server config if present
function Module.get_settings_for(lspconfig_server_name)
  if lspconfig_server_name == "sumneko_lua" then
    return require("lsp.lang_settings.sumneko-lua")

  elseif lspconfig_server_name == "jsonls" then
    return require("lsp.lang_settings.jsonls")

  elseif lspconfig_server_name == "eslint" then
    return require("lsp.lang_settings.eslint")

  elseif lspconfig_server_name == "ansiblels" then
    return require("lsp.lang_settings.ansiblels")

  else
    return {}
  end
end

return Module
