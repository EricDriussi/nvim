local option = vim.opt

-- UI
option.laststatus = 3
option.pumheight = 10
option.splitbelow = true
option.splitright = true
option.termguicolors = true
option.title = true -- Title to current file instead of terminal emulator name

-- Line and offests
option.cursorline = true
option.linebreak = true -- Avoid splitting words when wrapping lines
option.scrolloff = 8 -- Breathing space
option.sidescrolloff = 5
option.wrap = true

-- Number-Sign column
option.number = true
option.numberwidth = 4
option.relativenumber = true
option.signcolumn = "yes"

-- History
option.swapfile = false
option.undodir = { vim.env.HOME .. "/.config/nvim/.undodir//" }
option.undofile = true

-- Tab be gud
option.expandtab = true
option.shiftwidth = 2
option.smartindent = true
option.softtabstop = 2

-- Misc
option.completeopt = "menuone,noselect,preview"
option.encoding = "utf-8"
option.errorbells = false
option.fileencoding = "utf-8"
option.ignorecase = true
option.mouse = "a"
option.smartcase = true
option.timeoutlen = 500
option.updatetime = 200