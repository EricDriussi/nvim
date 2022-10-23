-- =============================== CORE ===============================
require("plugin_config.core")

-- ============================= PLUGINS =============================
-- Misc config
require("plugin_config.misc")
-- Colorscheme
require("plugin_config.colorscheme")
-- Telescopic
require("plugin_config.telescope")
-- Gitsigns
require("plugin_config.gitsigns")
-- ToggleTerm
require("plugin_config.toggleterm")
-- WhichKey
require("plugin_config.which-key")
-- NvimTree
require("plugin_config.nvim-tree")
-- Autopairs
require("plugin_config.autopairs")
-- Lualine
require("plugin_config.lualine")
-- Search and Replace
require("plugin_config.spectre")
-- Winbar
require("plugin_config.winbar")
-- Harpoon
require("harpoon").setup({ menu = { width = vim.api.nvim_win_get_width(0) - 70 } })
-- Highlights
require("illuminate").configure({ max_file_lines = 5000, filetypes_denylist = { "NvimTree", "Telescope" } })
-- Autolist
require("autolist").setup({ lists = { filetypes = { generic = { "none", "markdown", "text" } } } })

-- ============================= DEFAULT =============================
-- Pretty QFList
require("pqf").setup()
-- Color hex codes
require("colorizer").setup()
-- Use nvim-rooter to always show full project
require("nvim-rooter").setup()
