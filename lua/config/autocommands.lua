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
  command = 'lua vim.lsp.buf.formatting_sync()'
})

Module = {}
local lsp_highlight_group = new_au_grp("LspHighlight", {})
function Module.activate_lsp_highlight()
  new_au_cmd("CursorHold, CursorHoldI", {
    group = lsp_highlight_group,
    pattern = "<buffer>",
    callback = function()
      vim.lsp.buf.document_highlight()
    end,
  })

  new_au_cmd("CursorMoved, CursorMovedI", {
    group = lsp_highlight_group,
    pattern = "<buffer>",
    callback = function()
      vim.lsp.buf.clear_references()
    end,
  })
end

return Module
