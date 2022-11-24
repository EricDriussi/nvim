local new_au_cmd = vim.api.nvim_create_autocmd
local new_au_grp = vim.api.nvim_create_augroup

new_au_cmd("BufWinEnter", {
  desc = "Avoid autocomment on enter in commented line",
  command = "set formatoptions-=cro"
})

new_au_cmd("TextYankPost", {
  desc = "Highlight on yank",
  group = new_au_grp("HighlightYank", {}),
  callback = function()
    vim.highlight.on_yank({
      higroup = "TermCursor",
      timeout = 60,
    })
  end,
})

local ftp_group = new_au_grp("FileTypeSettings", {})
new_au_cmd("FileType", {
  desc = "Disable spellcheck for certain buffers",
  group = ftp_group,
  pattern = { "man", "harpoon", "TelescopePrompt" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- TODO.unnecessary?
new_au_cmd("BufEnter", {
  desc = "Set filetype to none",
  group = ftp_group,
  callback = function()
    if vim.bo.filetype == "" then
      vim.opt_local.filetype = "none"
    end
  end,
})

new_au_cmd("FileType", {
  desc = "Enable bilingual spellcheck for certain buffers",
  group = ftp_group,
  pattern = { "gitcommit", "none" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "es", "en" }
  end,
})

new_au_cmd("FileType", {
  desc = "GoTo navigation for help files",
  group = ftp_group,
  pattern = { "help", "man" },
  callback = function()
    vim.keymap.set("n", "gd", "<C-]>")
  end,
})

new_au_cmd("BufWritePre", {
  desc = "Format on save",
  group = new_au_grp("FormatOnSaveGroup", {}),
  -- writing this in lua fks up the toggle
  command = "lua vim.lsp.buf.format({ async = false })"
})

local status_ok, session = pcall(require, "config.scripts.sessions")
-- Only create aucmds if session script is available and error free
if status_ok and type(session) == "table" then

  local sessions_group = new_au_grp("SessionsGroup", {})
  new_au_cmd("VimEnter", {
    desc = "Load Session",
    group = sessions_group,
    callback = session.load,
    nested = true
  })

  new_au_cmd("VimLeavePre", {
    desc = "Load Session",
    group = sessions_group,
    callback = session.save,
  })
end
