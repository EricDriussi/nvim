local option = vim.opt

-- UI
option.laststatus = 3
option.pumheight = 10
option.splitbelow = true
option.splitright = true
option.termguicolors = true
option.title = true -- Title to current file instead of terminal emulator name
option.showmode = false
option.confirm = true
option.shortmess:append("Wc")

-- Line and offests
option.cursorline = true
option.linebreak = true -- Avoid splitting words when wrapping lines
option.breakindent = true
option.scrolloff = 8
option.sidescrolloff = 5
option.wrap = true

-- Number-Sign column
option.number = true
option.numberwidth = 3
option.relativenumber = true
option.signcolumn = "yes"

-- History
option.history = 1000
option.swapfile = false
option.undodir = { vim.env.HOME .. "/.config/nvim/.undodir//" }
option.undofile = true

-- Tab be gud
option.copyindent = true
option.preserveindent = true
option.smartindent = true
option.expandtab = true
local tabsize = 2
option.shiftwidth = tabsize
option.softtabstop = tabsize
option.tabstop = tabsize

-- Misc
option.completeopt = { "menu", "menuone", "preview" }
option.mouse = "a"
option.timeoutlen = 500
option.ignorecase = true
option.smartcase = true
option.infercase = true
