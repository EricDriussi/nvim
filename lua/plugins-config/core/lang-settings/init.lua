local Module = {}
-- Fetch custom server config if present
function Module.get_settings_for(lspconfig_server_name)
  if lspconfig_server_name == "sumneko_lua" then
    return require("plugins-config.core.lang-settings.sumneko-lua")

  elseif lspconfig_server_name == "jsonls" then
    return require("plugins-config.core.lang-settings.jsonls")

  elseif lspconfig_server_name == "eslint" then
    return require("plugins-config.core.lang-settings.eslint")

  else
    return {}
  end
end

return Module
