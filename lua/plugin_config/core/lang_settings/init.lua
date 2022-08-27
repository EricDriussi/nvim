local Module = {}
-- Fetch custom server config if present
function Module.get_settings_for(lspconfig_server_name)
  if lspconfig_server_name == "sumneko_lua" then
    return require("plugin_config.core.lang_settings.sumneko-lua")

  elseif lspconfig_server_name == "jsonls" then
    return require("plugin_config.core.lang_settings.jsonls")

  elseif lspconfig_server_name == "eslint" then
    return require("plugin_config.core.lang_settings.eslint")

  else
    return {}
  end
end

return Module
