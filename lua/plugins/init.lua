require("plugins.null-ls")
require("plugins.treesitter")
require("plugins.completion")
require("plugins.misc")
require("plugins.colorscheme")
require("plugins.telescope")
require("plugins.gitsigns")
require("plugins.diffview")
require("plugins.toggleterm")
require("plugins.which-key")
require("plugins.nvim-tree")
require("plugins.autopairs")
require("plugins.lualine")
-- Search and Replace
require("plugins.spectre")
require("plugins.winbar")
require("harpoon").setup({ menu = { width = vim.api.nvim_win_get_width(0) - 70 } })
-- Highlights
require("illuminate").configure({ max_file_lines = 5000, filetypes_denylist = { "NvimTree", "Telescope" } })
require("autolist").setup({ lists = { filetypes = { generic = { "none", "markdown", "text" } } } })

-- ============================= DEFAULT SETUPS =============================
-- Pretty QFList
require("pqf").setup()
-- Color hex codes
require("colorizer").setup()
-- Use nvim-rooter to always show full project
require("nvim-rooter").setup()
require("remember_me").setup()
