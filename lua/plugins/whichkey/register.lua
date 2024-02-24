local mappings = {
	base = {
		["<C-Space>"] = { "<cmd>Telescope spell_suggest<cr>", "Spelling" },
		["<C-b>"] = { "<cmd>Telescope lsp_references<cr>", "Show References" },
		["<C-g>"] = { "<cmd>.,.GBrowse!<cr>", "Copy remote repo link" },
		["<C-k>"] = { vim.lsp.buf.hover, "Hover" },
		["<M-cr>"] = { vim.lsp.buf.code_action, "Code Actions" },
		["<M-g>"] = {
			"<cmd>lua require('toggleterm.terminal').Terminal:new({ cmd = 'lazygit', hidden = true }):toggle()<cr>",
			"Lazygit",
		},
		["rn"] = { vim.lsp.buf.rename, "Rename" },
		["zO"] = { require("ufo").openAllFolds, "Open all folds" },
		["zC"] = { require("ufo").closeAllFolds, "Close all folds" },
	},

	leader = {
		["/"] = { "<cmd>CommentToggle<cr>", "Comment" },
		["?"] = { "<cmd>Mason<cr>", "LSP" },
		["A"] = { "<cmd>Telescope commands<cr>", "Actions" },
		["F"] = { "<cmd>Telescope live_grep<cr>", "Find in files" },
		["H"] = { "<cmd>Telescope help_tags<cr>", "Help" },
		["L"] = {
			function()
				vim.g.no_fos = not vim.g.no_fos
				if vim.g.no_fos then
					print("Format on save OFF")
				else
					print("Format on save ON")
				end
			end,
			"Toggle FOS",
		},
		["R"] = { "<cmd>Telescope registers<cr>", "Registers" },
		["a"] = { "<Cmd>lua require('harpoon.mark').add_file()<CR>", "Add Harpoon" },
		["d"] = { "<cmd>DiffToggle<cr>", "Diff Mode" },
		["e"] = { "<cmd>Neotree toggle reveal<cr>", "Explorer" },
		["f"] = {
			"<cmd>lua require('telescope').extensions.smart_open.smart_open({ cwd_only = true, })<cr>",
			"Find File",
		},
		["h"] = { "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoons" },
		["l"] = { "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<cr>", "Format" },
		["S"] = { "<cmd>lua require('spectre').open_visual({ select_word=true })<cr>", "Seek & Destroy" },

		s = {
			name = "Split",
			v = { "<cmd>vsplit<cr>", "Split Right" },
			h = { "<cmd>split<cr>", "Split Down" },
			s = { "<cmd>SwapSplit<cr>", "Swap" },
		},

		g = {
			name = "Git",
			A = { "<cmd>Git blame<cr>", "Git Anotate File" },
			a = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Git Anotate Line" },
			b = { "<cmd>Gitsigns reset_hunk<cr>", "Git Back Hunk" },
			h = { "<cmd>diffget LOCAL<cr>", "Get From Current (Local)" },
			l = { "<cmd>diffget REMOTE<cr>", "Get From Incoming (Remote)" },
			n = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk/Conflict" },
			p = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk/Conflict" },
			r = { "<cmd>Telescope git_branches<cr>", "Branches" },
			c = { "<cmd>DiffviewOpen<cr>", "Pre-Commit Diff" },
			H = { "<cmd>DiffviewFileHistory %<cr>", "File History" },
		},

		P = {
			name = "Pretty",
			j = { "<cmd>%!jq<cr>", "Json" },
			c = { "<cmd>%!column -t<cr>", "Columns" },
		},

		t = {
			name = "Test",
			r = {
				"<cmd>lua require('neotest').run.run() require('neotest').summary.open()<cr>",
				"Run closest",
			},
			R = {
				"<cmd>lua require('neotest').run.run(vim.fn.expand('%')) require('neotest').summary.open()<cr>",
				"Run file",
			},
			t = { "<cmd> lua require('neotest').summary.toggle()<cr>", "Output toggle" },
			s = { "<cmd> lua require('neotest').run.stop()<cr>", "Stop test" },
		},
	},

	visual = {
		["/"] = { ":'<,'>CommentToggle<cr>", "Comment" },
		["F"] = { '"zy:Telescope live_grep default_text=<C-r>z<cr>', "Find Selected Text" },
		["S"] = { "<esc><cmd>lua require('spectre').open_visual()<cr>", "Seek & Destroy" },

		g = {
			name = "Git",
			b = { "<cmd>Gitsigns reset_hunk<cr>", "Git Back Hunk" },
			h = { ":'<,'>diffget LOCAL<cr>", "Get From Current (Local)" },
			l = { ":'<,'>diffget REMOTE<cr>", "Get From Incoming (Remote)" },
		},

		P = {
			name = "Pretty",
			j = { ":'<,'>!jq<cr>", "Json" },
			c = { ":'<,'>!column -t<cr>", "Columns" },
		},
	},

	go_to = {
		["d"] = { "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
		["e"] = { "<cmd>lua vim.diagnostic.open_float({scope='line'})<cr>", "Get Error" },
		["i"] = { "<cmd>Telescope lsp_implementations<cr>", "Goto Implementation" },
		["n"] = { "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<cr>", "Goto Next Error" },
		["p"] = { "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<cr>", "Goto Prev Error" },
		["q"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Diagnostics -> qf list" },
		["r"] = { "<cmd>Telescope lsp_references<cr>", "Goto References" },
		["x"] = { "<cmd>Browse<cr>", "Open in Browser" },
	},

	super_tab = {
		["<Tab>"] = {
			function()
				local copilot_ok, copilot_suggestion = pcall(require, "copilot.suggestion")
				if require("luasnip").jumpable(1) then
					require("luasnip").jump(1)
				elseif copilot_ok and copilot_suggestion.is_visible() then
					copilot_suggestion.accept()
				else
					-- use default Tab behavior
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", true)
				end
			end,
			"Super Tab",
		},
		["<S-Tab>"] = {
			function()
				local copilot_ok, copilot_suggestion = pcall(require, "copilot.suggestion")
				if require("luasnip").jumpable(-1) then
					require("luasnip").jump(-1)
				elseif copilot_ok and copilot_suggestion.is_visible() then
					copilot_suggestion.next()
				else
					-- use default S-Tab behavior
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<BS>", true, true, true), "n", true)
				end
			end,
			"Super Shift Tab",
		},
	},
}

local function default_opts_with(mode, prefix)
	return {
		mode = mode,
		prefix = prefix or "",
		nowait = true,
	}
end

return function()
	local which_key = require("which-key")
	which_key.register(mappings.base, default_opts_with("n"))
	which_key.register(mappings.leader, default_opts_with("n", "<leader>"))
	which_key.register(mappings.visual, default_opts_with("v", "<leader>"))
	which_key.register({ ["<C-g>"] = { ":'<,'>GBrowse!<cr>", "Copy remote repo link" } }, default_opts_with("v"))
	which_key.register(mappings.go_to, default_opts_with("n", "g"))
	which_key.register(mappings.super_tab, default_opts_with("i"))
end
