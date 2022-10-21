-- GRUVBOX
--vim.cmd("colorscheme base16-gruvbox-dark-medium")
---- Too much red...
--vim.api.nvim_set_hl(0, "TSVariable", { fg = "#8ec07c" })

---- Highlight references for word under cursor
--vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3c3836" })
--vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3c3836" })
--vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3c3836", bold = true })

---- Warnings
--vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#fabd2f" })
--vim.cmd("hi DiagnosticUnderlineWarning guisp=#fabd2f")
--vim.cmd("hi DiagnosticUnderlineWarn guisp=#fabd2f")

---- hl-search scream less
--vim.api.nvim_set_hl(0, "Search", { bg = "#a67c00", bold = true })

-- CATPPUCCIN
vim.g.catppuccin_flavour = "mocha"
vim.api.nvim_command "colorscheme catppuccin"

-- Highlight references for word under cursor
local cp = require("catppuccin.palettes").get_palette("mocha")
vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = cp.surface0 })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = cp.surface0 })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = cp.surface0, bold = true })

-- Make visual selections more visible
vim.api.nvim_set_hl(0, "Visual", { bg = cp.surface2, bold = true })

-- hl-search scream less
vim.api.nvim_set_hl(0, "CurSearch", { bg = cp.mauve, bold = true })
