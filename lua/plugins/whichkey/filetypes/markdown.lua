local function es_spellcheck(bufnr)
	local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]

	local latex_es_comment = "<!-- LTeX: language=es -->"
	if first_line == latex_es_comment then
		vim.api.nvim_buf_set_lines(bufnr, 0, 1, false, {})
	else
		vim.api.nvim_buf_set_lines(bufnr, 0, 1, false, { latex_es_comment, first_line })
	end
end

return function(wk)
	local bufnr = vim.api.nvim_get_current_buf()
	local filetype = vim.bo.filetype
	if filetype ~= "markdown" then
		return
	end

	wk.register({
		m = {
			name = "MarkDown",
			m = { "<cmd>MarkdownPreviewToggle<cr>", "Preview MD" },
			b = { "viw:lua require('markdowny').bold()<cr>", "Make bold" },
			i = { "viw:lua require('markdowny').italic()<cr>", "Make italics" },
			l = { "viw:lua require('markdowny').link()<cr>", "Make link" },
			c = { "viw:lua require('markdowny').code()<cr>", "Make inline code" },
			s = {
				function()
					es_spellcheck(bufnr)
				end,
				"Toggle Spanish spellcheck",
			},
		},
	}, {
		mode = "n",
		prefix = "<leader>",
		nowait = true,
	})

	wk.register({
		m = {
			name = "MarkDown",
			b = { ":lua require('markdowny').bold()<cr>", "Make bold" },
			i = { ":lua require('markdowny').italic()<cr>", "Make italics" },
			l = { ":lua require('markdowny').link()<cr>", "Make link" },
			c = { ":lua require('markdowny').code()<cr>", "Make inline code" },
		},
	}, {
		mode = "v",
		prefix = "<leader>",
		nowait = true,
	})
end
