local M = {}

M.basicSources = {
	{ name = "nvim_lsp" },
	{ name = "buffer",                 max_item_count = 4 },
	{ name = "emoji" },
	{ name = "path" },
	{ name = "nvim_lsp_signature_help" },
}

M.withAIs = vim.deepcopy(M.basicSources)
table.insert(M.withAIs, 3, { name = "codeium", max_item_count = 3 })
table.insert(M.withAIs, 4, { name = "luasnip", max_item_count = 3 })

return M
