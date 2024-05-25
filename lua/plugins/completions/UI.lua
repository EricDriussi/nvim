local lspkind = require("lspkind")
Module = {}

Module.entries = {
	fields = { "kind", "abbr", "menu" },
	format = lspkind.cmp_format({
		mode = "symbol",
		maxwidth = 25,
		ellipsis_char = "…",

		before = function(entry, item)
			item.menu = ({
				nvim_lsp = "[L]",
				buffer = "[B]",
				path = "[P]",
				luasnip = "[S]",
				emoji = "[E]",
			})[entry.source.name]
			return item
		end,
	}),
}

return Module
