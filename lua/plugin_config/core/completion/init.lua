local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  mapping = require("plugin_config.core.completion.mappings"),
  sources = require("plugin_config.core.completion.sources"),
  formatting = require("plugin_config.core.completion.UI").entries,
  window = require("plugin_config.core.completion.UI").windows,

}
