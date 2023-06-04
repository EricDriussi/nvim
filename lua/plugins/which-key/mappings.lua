return {
	base = {
		["<C-Space>"] = { "<Cmd>Telescope spell_suggest<CR>", "Spelling" },
		["<C-b>"] = { "<Cmd>Telescope lsp_references<CR>", "Show References" },
		["<C-g>"] = {
			"<Cmd>lua require\"nvim-git-link\".get_remote_link{ copy = true }<CR><Cmd>echo 'Copied GH link to system clipboard!'<CR>",
			"Copy GH link",
		},
		["<C-k>"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		["<M-CR>"] = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
		["<M-g>"] = { "<Cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		["rn"] = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		["<M-C-f>"] = { "viW<Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Refactors" },
		["zO"] = { require("ufo").openAllFolds, "Open all folds" },
		["zC"] = { require("ufo").closeAllFolds, "Close all folds" },
	},
	leader = {
		["/"] = { "<plug>NERDCommenterToggle<CR>k", "Comment" },
		["?"] = { "<Cmd>Mason<CR>", "LSP" },
		["A"] = { "<Cmd>Telescope commands<CR>", "Actions" },
		["F"] = { "<Cmd>Telescope live_grep<CR>", "Find in files" },
		["H"] = { "<Cmd>Telescope help_tags<CR>", "Help" },
		["L"] = { "<Cmd>ToggleAucmdsByGroup FormatOnSaveGroup<CR>", "Toggle FOS" },
		["R"] = { "<Cmd>Telescope registers<CR>", "Registers" },
		["a"] = { "<Cmd>lua require('harpoon.mark').add_file()<CR>", "Add Harpoon" },
		["d"] = { "<Cmd>:DiffToggle<CR>", "Diff Mode" },
		["e"] = { "<Cmd>Neotree toggle reveal<CR>", "Explorer" },
		["f"] = {
			"<Cmd>lua require('telescope').extensions.smart_open.smart_open({cwd_only = true}) <CR>",
			"Find File",
		},
		["h"] = { "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoons" },
		["l"] = { "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format" },
		["S"] = { "<Cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Seek & Destroy" },

		m = {
			name = "MarkDown",
			m = { "<Cmd>MarkdownPreviewToggle<CR>", "Preview MD" },
			b = { "viw:lua require('markdowny').bold()<CR>", "Make bold" },
			i = { "viw:lua require('markdowny').italic()<CR>", "Make italics" },
			l = { "viw:lua require('markdowny').link()<CR>", "Make link" },
			c = { "viw:lua require('markdowny').code()<CR>", "Make inline code" },
		},

		s = {
			name = "Split",
			v = { "<Cmd>vsplit<CR>", "Split Right" },
			h = { "<Cmd>split<CR>", "Split Down" },
			s = { "<Cmd>SwapSplit<CR>", "Swap" },
		},

		g = {
			name = "Git",
			A = { "<Cmd>Git blame<CR>", "Git Anotate File" },
			a = { "<Cmd>Gitsigns toggle_current_line_blame<CR>", "Git Anotate Line" },
			b = { "<Cmd>Gitsigns reset_hunk<CR>", "Git Back Hunk" },
			h = { "<Cmd>diffget LOCAL<CR>", "Get From Current (Local)" },
			l = { "<Cmd>diffget REMOTE<CR>", "Get From Incoming (Remote)" },
			n = { "<Cmd>Gitsigns next_hunk<CR>", "Next Hunk/Conflict" },
			p = { "<Cmd>Gitsigns prev_hunk<CR>", "Prev Hunk/Conflict" },
			r = { "<Cmd>Telescope git_branches<CR>", "Branches" },
			s = { "<Cmd>Gvdiffsplit<bar>windo set wrap<CR>", "Split with HEAD" },
			c = { "<Cmd>DiffviewOpen<CR>", "Pre-Commit Diff" },
			H = { "<Cmd>DiffviewFileHistory %<CR>", "File History" },
		},

		P = {
			name = "Pretty",
			j = { "<Cmd>%!jq<CR>", "Json" },
			c = { "<Cmd>%!column -t<CR>", "Columns" },
		},

		t = {
			name = "Test",
			r = { "<Cmd>lua require('neotest').run.run() require('neotest').output_panel.toggle()<CR>", "Run closest" },
			R = {
				"<Cmd>lua require('neotest').run.run(vim.fn.expand('%')) require('neotest').summary.open()<CR>",
				"Run file",
			},
			o = { "<Cmd>lua require('neotest').output_panel.toggle()<CR>", "Output toggle" },
			s = { "<Cmd>lua require('neotest').summary.toggle()<CR>", "Summary toggle" },
			S = { "<Cmd>lua require('neotest').run.stop()<CR>", "Stop test" },
		},
	},
	visual = {
		["/"] = { "<plug>NERDCommenterToggle<CR>k", "Comment" },
		["F"] = { '"zy:Telescope live_grep default_text=<C-r>z<cr>', "Find Selected Text" },
		["s"] = { "<Esc><Cmd>lua require('spectre').open_visual()<CR>", "Seek & Destroy" },
		["<M-C-f>"] = { "<Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Refactors" },

		g = {
			name = "Git",
			b = { "<Cmd>Gitsigns reset_hunk<CR>", "Git Back Hunk" },
			h = { "<Cmd>'<,'>diffget LOCAL<CR>", "Get From Current (Local)" },
			l = { "<Cmd>'<,'>diffget REMOTE<CR>", "Get From Incoming (Remote)" },
		},

		P = {
			name = "Pretty",
			j = { "<Cmd>'<,'>!jq<CR>", "Json" },
			c = { "<Cmd>'<,'>!column -t<CR>", "Columns" },
		},

		m = {
			name = "MarkDown",
			b = { ":lua require('markdowny').bold()<CR>", "Make bold" },
			i = { ":lua require('markdowny').italic()<CR>", "Make italics" },
			l = { ":lua require('markdowny').link()<CR>", "Make link" },
			c = { ":lua require('markdowny').code()<CR>", "Make inline code" },
		},
	},
	go_to = {
		["d"] = { "<Cmd>Telescope lsp_definitions<CR>", "Goto Definition" },
		["e"] = { "<Cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>", "Get Error" },
		["i"] = { "<Cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
		["n"] = { "<Cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", "Goto Next Error" },
		["p"] = { "<Cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", "Goto Prev Error" },
		["q"] = { "<Cmd>lua vim.diagnostic.setloclist()<CR>", "Diagnostics -> qf list" },
		["r"] = { "<Cmd>Telescope lsp_references<CR>", "Goto References" },
		["x"] = { "Open in Browser" },
	},
}
