require("config")

vim.api.nvim_command("command! WQ wq")
vim.api.nvim_command("command! Wq wq")
vim.api.nvim_command("command! W w")
vim.api.nvim_command("command! Q q")

-- Perf settings
local option = vim.opt
option.cursorline = false
option.cursorcolumn = false
option.relativenumber = false
option.signcolumn = "no"
option.hidden = false
option.syntax = "off"
option.lazyretraw = true

-- Disable builtin plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
