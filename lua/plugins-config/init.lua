-- Completion
require("plugins-config.core.cmp")
-- LSP
require("plugins-config.lsp")
-- Telescopic
require("plugins-config.telescope")
-- Treesitter
require("plugins-config.core.treesitter")
-- Gitsigns
require("plugins-config.gitsigns")
-- ToggleTerm
require("plugins-config.toggleterm")
-- WhichKey
require("plugins-config.which-key")
-- NvimTree
require("plugins-config.nvim-tree")
-- Autopairs
require("plugins-config.autopairs")
-- Null-ls
require("plugins-config.core.null-ls")
-- Lualine
require("plugins-config.lualine")
-- Bufferline
require("plugins-config.bufferline")
-- Search and Replace
require("plugins-config.spectre")
-- Format on save toggle script
require("plugins-config.format-toggle")
-- Harpoon
require("harpoon").setup({ menu = { width = vim.api.nvim_win_get_width(0) - 70 } })
-- Pretty QFList
require('pqf').setup()
