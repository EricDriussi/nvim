-- =============================== CORE ===============================
require("plugins-config.core")

-- ============================= PLUGINS =============================
-- Misc config
require("plugins-config.misc")
-- Colorscheme
require("plugins-config.colorscheme")
-- Telescopic
require("plugins-config.telescope")
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
-- Lualine
require("plugins-config.lualine")
-- Bufferline
require("plugins-config.bufferline")
-- Search and Replace
require("plugins-config.spectre")
-- Harpoon
require("harpoon").setup({ menu = { width = vim.api.nvim_win_get_width(0) - 70 } })

-- ============================= DEFAULT =============================
-- Pretty QFList
require("pqf").setup()
-- Color hex codes
require("colorizer").setup()
-- Use nvim-rooter to always show full project
require("nvim-rooter").setup()
