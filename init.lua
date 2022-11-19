-- TODO.move to keymap
vim.g.mapleader = " "

-- TODO.move?
vim.api.nvim_command("command! WQ wq")
vim.api.nvim_command("command! Wq wq")
vim.api.nvim_command("command! W w")
vim.api.nvim_command("command! Q q")
vim.api.nvim_command("source ~/.config/nvim/lua/plug.vim")

require("config")
require("lsp")
require("plugins")
require("plugin_config")
