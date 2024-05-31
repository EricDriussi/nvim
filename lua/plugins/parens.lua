return {
	{
		"tpope/vim-surround",
		init = function()
			local map = function(lhs, rhs)
				return vim.api.nvim_set_keymap("v", lhs, rhs, {})
			end

			map("(", "S)")
			map("[", "S]")
			map("{", "S}")
			map("'", "S'")
			map('"', 'S"')
			map("`", "S`")
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = { "nvim-treesitter" },
		config = function()
			local autopairs = require("nvim-autopairs")

			autopairs.setup({
				-- Use TreeSitter
				check_ts = true,
				enable_check_bracket_line = false,
			})

			local except = require("nvim-autopairs.conds")

			-- Modify predefined Rules
			autopairs.get_rule('"')[1]:with_pair(except.not_after_regex("%w")):with_pair(except.not_before_regex("%w"))
			autopairs.get_rule("'")[1]:with_pair(except.not_after_regex("%w")):with_pair(except.not_before_regex("%w"))

			-- Add custom Rules
			local custom_rule = require("nvim-autopairs.rule")
			autopairs.add_rules({
				-- MD bold and italics
				custom_rule("*", "*", { "md", "markdown" })
					:with_pair(except.not_after_regex("%w"))
					:with_pair(except.not_before_regex("%w")),
				custom_rule("`", "`"):with_pair(except.not_after_regex("%w")):with_pair(except.not_before_regex("%w")),

				-- Spanish
				custom_rule("¿", "?"):with_pair(except.not_after_regex("%w")):with_pair(except.not_before_regex("%w")),
				custom_rule("¡", "!"):with_pair(except.not_after_regex("%w")):with_pair(except.not_before_regex("%w")),

				-- js arrow function
				custom_rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript" })
					:use_regex(true)
					:set_end_pair_length(2),

				-- spacing for = sign
				custom_rule("=", "", { "-vim", "-zsh", "-env", "-sh", "-bash", "-yaml", "-yml" })
					:with_pair(except.not_inside_quote())
					:with_pair(function(opts)
						local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
						if last_char:match("[%w%=%s]") then
							return true
						end
						return false
					end)
					:replace_endpair(function(opts)
						local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
						local next_char = opts.line:sub(opts.col, opts.col)
						next_char = next_char == " " and "" or " "
						if prev_2char:match("%w$") then
							return "<bs> =" .. next_char
						end
						if prev_2char:match("%=$") then
							return next_char
						end
						if prev_2char:match("=") then
							return "<bs><bs>=" .. next_char
						end
						return ""
					end)
					:set_end_pair_length(0)
					:with_move(except.none())
					:with_del(except.none()),
			})
		end,
	},
}
