return function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		preselect = cmp.PreselectMode.Item,
		mapping = require("plugins.completions.mappings")(cmp),
		formatting = require("plugins.completions.UI").entries,
		window = require("plugins.completions.UI").windows,
		sources = require("plugins.completions.sources"),
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = "buffer" } },
		}),
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
		}),
		cmp.setup.filetype({ "sql", "mysql", "psql" }, {
			sources = {
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			},
		}),
	})

	-- Autopairs
	cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
end
