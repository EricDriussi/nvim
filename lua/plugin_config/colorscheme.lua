vim.cmd("colorscheme base16-gruvbox-dark-medium")
-- Too much red...
vim.api.nvim_set_hl(0, "TSVariable", { fg = "#8ec07c" })

-- Highlight references for word under cursor
vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#504945", bold = true })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#504945", bold = true })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#504945", bold = true })

-- Warnings
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#fabd2f" })
vim.cmd("hi DiagnosticUnderlineWarning guisp=#fabd2f")
vim.cmd("hi DiagnosticUnderlineWarn guisp=#fabd2f")

-- hl-search scream less
vim.api.nvim_set_hl(0, "Search", { bg = "#a67c00", bold = true })
