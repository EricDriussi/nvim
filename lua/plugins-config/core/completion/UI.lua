Module = {}

Module.entries = {
  fields = { "kind", "abbr", "menu" },
  format = function(entry, item)
    -- Icons
    item.kind = string.format("%s", require("config.icons")[item.kind])
    -- Sources Labels
    item.menu = ({
      nvim_lsp = "[L]",
      buffer = "[B]",
      cmp_tabnine = "[9]",
      path = "[P]",
      luasnip = "[S]",
      emoji = "[E]",
    })[entry.source.name]
    return item
  end,
}

Module.windows = {
  completion = {
    border = 'shadow',
    winhighlight = '',
    col_offset = -3,
  },
  documentation = {
    border = 'shadow',
  },
}

return Module