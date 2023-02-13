local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Insert,
		select = false,
	},

	mapping = require("plugins.completion.mappings"),
	sources = require("plugins.completion.sources"),
	formatting = require("plugins.completion.UI").entries,
	window = require("plugins.completion.UI").windows,
})
