local M = {}

M.basicSources = {
	{ name = "nvim_lsp" },
	{ name = "buffer", keyword_length = 4, max_item_count = 3 },
	{ name = "emoji" },
	{ name = "path" },
	{ name = "nvim_lsp_signature_help" },
}

M.withAIs = vim.deepcopy(M.basicSources)
table.insert(M.withAIs, 2, { name = "copilot", max_item_count = 3 })
table.insert(M.withAIs, 3, { name = "codeium", max_item_count = 3 })
table.insert(M.withAIs, 4, { name = "luasnip", max_item_count = 3 })

return M
