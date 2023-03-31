return function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		preselect = cmp.PreselectMode.Item,
		mapping = require("plugins.completion.mappings"),
		sources = require("plugins.completion.sources"),
		formatting = require("plugins.completion.UI").entries,
		window = require("plugins.completion.UI").windows,
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		}),
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		}),
	})

	-- Autopairs
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end
