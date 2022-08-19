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

  mapping = require("plugins-config.core.cmp.mappings"),
  sources = require("plugins-config.core.cmp.sources"),
  formatting = require("plugins-config.core.cmp.formatting").entries,
  window = require("plugins-config.core.cmp.formatting").windows,

}
