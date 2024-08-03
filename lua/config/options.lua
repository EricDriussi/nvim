vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_statuscolumn = {
  folds_open = true,
}
vim.g.lazygit_config = false

local opt = vim.opt

opt.clipboard = ""
opt.conceallevel = 0
opt.scrolloff = 8
opt.sidescrolloff = 5
opt.spelllang = { "en" }
opt.spelloptions:append("camel")
opt.undolevels = 10000
opt.updatetime = 200
opt.undodir = vim.env.HOME .. "/.config/nvim/.undodir/"
opt.wrap = true
opt.history = 1000
opt.swapfile = false
