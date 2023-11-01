return function(cmp)
	return {
		-- trigger completion
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- accept currently selected item. If none selected, `select = true` first item.
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		-- abort completion (doesn't behave as expected with <esc>)
		["<C-q>"] = cmp.mapping(cmp.mapping.abort()),
		-- scroll completions
		["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		-- scroll docs
		["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
	}
end
