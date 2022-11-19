-- Null-ls config
require("plugins.null-ls")
-- Treesitter config
require("plugins.treesitter")
-- Cmp config
require("plugins.completion")
-- Misc config
require("plugins.misc")
-- Colorscheme
require("plugins.colorscheme")
-- Telescopic
require("plugins.telescope")
-- Gitsigns
require("plugins.gitsigns")
-- ToggleTerm
require("plugins.toggleterm")
-- WhichKey
require("plugins.which-key")
-- NvimTree
require("plugins.nvim-tree")
-- Autopairs
require("plugins.autopairs")
-- Lualine
require("plugins.lualine")
-- Search and Replace
require("plugins.spectre")
-- Winbar
require("plugins.winbar")
-- Harpoon
require("harpoon").setup({ menu = { width = vim.api.nvim_win_get_width(0) - 70 } })
-- Highlights
require("illuminate").configure({ max_file_lines = 5000, filetypes_denylist = { "NvimTree", "Telescope" } })
-- Autolist
require("autolist").setup({ lists = { filetypes = { generic = { "none", "markdown", "text" } } } })

-- ============================= DEFAULT SETUPS =============================
-- Pretty QFList
require("pqf").setup()
-- Color hex codes
require("colorizer").setup()
-- Use nvim-rooter to always show full project
require("nvim-rooter").setup()
