local aucmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

aucmd("BufWinEnter", {
  desc = "Avoid autocomment on 'o' in commented line",
  command = "set formatoptions-=o",
})

-- rm LazyVim autocmd
local yank_event = "TextYankPost"
vim.api.nvim_clear_autocmds({
  event = yank_event,
})

aucmd(yank_event, {
  desc = "Highlight on yank",
  group = augroup("HighlightYank", {}),
  callback = function()
    vim.highlight.on_yank({
      higroup = "TermCursor",
      timeout = 60,
    })
  end,
})

local ftp_group = augroup("FileTypeSettings", {})
aucmd("FileType", {
  desc = "Disable spellcheck for certain buffers",
  group = ftp_group,
  pattern = { "man", "TelescopePrompt" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

aucmd("FileType", {
  desc = "GoTo navigation for help files",
  group = ftp_group,
  pattern = { "help", "man" },
  callback = function()
    vim.keymap.set("n", "gd", "<C-]>")
  end,
})
