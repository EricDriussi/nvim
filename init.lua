-- TODO.move to keymap
vim.g.mapleader = " "

vim.api.nvim_command("source ~/.config/nvim/lua/plug.vim")
require("plugin_config")

vim.api.nvim_command("command! WQ wq")
vim.api.nvim_command("command! Wq wq")
vim.api.nvim_command("command! W w")
vim.api.nvim_command("command! Q q")
