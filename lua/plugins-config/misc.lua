local g = vim.g
local map = vim.api.nvim_set_keymap
-- Quickscope only highlight on keys
g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }

-- Thing between editorconfig and fugitive
g.EditorConfig_exclude_patterns = { 'fugitive://.*' }

-- Better comment toggle for code blocks
g.NERDToggleCheckAllLines = 1

-- FixCursorHold
g.cursorhold_updatetime = 100

-- Surround.vim
map("v", "(", "S)", {})
map("v", "[", "S]", {})
map("v", "{", "S}", {})
map("v", "'", "S'", {})
map("v", '"', 'S"', {})
map("v", "`", "S`", {})

-- MultiCursor behave like intelliJ
vim.api.nvim_exec([[ let g:VM_custom_remaps = {'N': 'Q'} ]], false)
