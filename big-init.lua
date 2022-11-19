local option = vim.opt
option.cursorline = false
option.cursorcolumn = false
option.relativenumber = false
option.signcolumn = false
option.hidden = false

vim.api.nvim_command("syntax sync minlines=200")
vim.api.nvim_command("syntax sync maxlines=500")

vim.api.nvim_command("command! WQ wq")
vim.api.nvim_command("command! Wq wq")
vim.api.nvim_command("command! W w")
vim.api.nvim_command("command! Q q")
