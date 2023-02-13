local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	-- trigger completion
	["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

	-- accept currently selected item. If none selected, `select = true` first item.
	["<CR>"] = cmp.mapping.confirm({ select = true }),

	-- abort completion (doesn't behave as expected with <esc>)
	["<C-q>"] = cmp.mapping(cmp.mapping.abort()),

	-- scroll completions
	["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
	["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
	-- scroll docs
	["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
	["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

	-- Super tab!!
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		elseif has_words_before() then
			cmp.complete()
		else
			fallback()
		end
	end, { "i", "s" }),

	["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
}
