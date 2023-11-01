local M = {}

M.basicSources = {
	{ name = "nvim_lsp", keyword_length = 2 },
	{ name = "buffer", keyword_length = 4, max_item_count = 4 },
	{ name = "emoji", keyword_length = 2 },
	{ name = "path", keyword_length = 2 },
	{ name = "nvim_lsp_signature_help", keyword_length = 2 },
}

M.withAIs = vim.deepcopy(M.basicSources)
table.insert(M.withAIs, 3, { name = "codeium", keyword_length = 2, max_item_count = 3 })
table.insert(M.withAIs, 4, { name = "luasnip", keyword_length = 2, max_item_count = 3 })

return M
