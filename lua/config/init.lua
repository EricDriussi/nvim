-- Settings/Options
require("config.setopts")
-- Diagnostics
require("config.diagnostics")
-- Autocmds
require("config.autocommands")
-- Basic Keymap
require("config.keymap")
-- Toggle Format on save
require("config.format_toggle")

-- Make floating windows pretty
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})
