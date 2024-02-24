Module = {}

-- from https://github.com/hrsh7th/nvim-cmp/discussions/609#discussioncomment-3395522
local function fixed_width(item)
	local truncate_char = "…"
	local truncate_width = 25
	local fill_whitespaces = function(len)
		return (" "):rep(truncate_width - len)
	end

	local content = item.abbr
	local isTooLong = #content > truncate_width
	if isTooLong then
		item.abbr = vim.fn.strcharpart(content, 0, truncate_width) .. truncate_char
	else
		item.abbr = content .. fill_whitespaces(#content)
	end
	return item
end

Module.entries = {
	fields = { "kind", "abbr", "menu" },
	format = function(entry, item)
		-- Icons
		item.kind = string.format("%s", require("plugins.completions.icons")[item.kind])
		-- Sources Labels
		item.menu = ({
			nvim_lsp = "[L]",
			buffer = "[B]",
			path = "[P]",
			luasnip = "[S]",
			emoji = "[E]",
		})[entry.source.name]
		return fixed_width(item)
	end,
}

return Module
