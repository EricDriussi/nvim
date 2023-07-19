local M = {}

M.allSources = {
	{ name = "nvim_lsp" },
	{ name = "copilot",                max_item_count = 3 },
	{ name = "codeium",                max_item_count = 3 },
	{ name = "luasnip",                max_item_count = 3 },
	{ name = "buffer",                 keyword_length = 5, max_item_count = 3 },
	{ name = "emoji" },
	{ name = "path" },
	{ name = "nvim_lsp_signature_help" },
}

M.AILessSources = {
	{ name = "nvim_lsp" },
	{ name = "luasnip",                max_item_count = 3 },
	{ name = "buffer",                 keyword_length = 5, max_item_count = 3 },
	{ name = "emoji" },
	{ name = "path" },
	{ name = "nvim_lsp_signature_help" },
}

return M
