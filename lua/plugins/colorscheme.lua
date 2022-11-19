-- needed here due to vim runtime
-- TODO.refactor dir structure
-- .
--├──  lua
--│  ├──  core
--│  │  ├── autocmds.lua
--│  │  ├── colors.lua
--│  │  ├── keymaps.lua
--│  │  ├── options.lua
--│  │  └── ...
--│  ├──  lsp
--│  │  ├── lspconfig.lua
--│  │  └── mason.lua
--│  ├──  plugins
--│  │  ├── nvim-cmp.lua
--│  │  ├── nvim-tree.lua
--│  │  ├── nvim-treesitter.lua
--│  │  └── ...
--│  └── plug.vim
--├──  autoload
--└── init.vim lua?

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "mix"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_current_word = "bold,italic"
vim.api.nvim_command "colorscheme gruvbox-material"
