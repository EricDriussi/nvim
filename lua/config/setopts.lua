local option = vim.opt

-- UI
option.laststatus = 3
option.pumheight = 10
option.splitbelow = true
option.splitright = true
option.termguicolors = true
option.title = true -- Title to current file instead of terminal emulator name
option.cmdheight = 1
option.showmode = false

-- Line and offests
option.cursorline = true
option.linebreak = true -- Avoid splitting words when wrapping lines
option.scrolloff = 8 -- Breathing space
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
option.expandtab = true
option.shiftwidth = 2
option.smartindent = true
option.smarttab = true
option.softtabstop = 2
option.tabstop = 2

-- Misc
option.completeopt = { "menu", "menuone", "noselect", "preview" }
option.encoding = "utf-8"
option.errorbells = false
option.fileencoding = "utf-8"
option.ignorecase = true
option.mouse = "a"
option.smartcase = true
option.timeoutlen = 500
option.updatetime = 200
