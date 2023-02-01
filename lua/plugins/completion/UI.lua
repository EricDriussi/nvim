Module = {}

Module.entries = {
  fields = { "kind", "abbr", "menu" },
  format = function(entry, item)
    -- Icons
    item.kind = string.format("%s", require("plugins.completion.icons")[item.kind])
    -- Sources Labels
    item.menu = ({
      nvim_lsp = "[L]",
      buffer = "[B]",
      path = "[P]",
      luasnip = "[S]",
      emoji = "[E]",
    })[entry.source.name]
    return item
  end,
}

Module.windows = {
  completion = {
    winhighlight = "",
    col_offset = -3,
  },
  documentation = {
    border = "single",
  },
}

return Module
