vim.cmd('colorscheme base16-gruvbox-dark-medium')
-- Too much red...
vim.api.nvim_set_hl(0, 'TSVariable', { fg = "#8ec07c" })
-- Highlight references for word under cursor
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = "#504945", bold = true })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = "#504945", bold = true })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = "#504945", bold = true })
