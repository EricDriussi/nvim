local new_au_cmd = vim.api.nvim_create_autocmd
local new_au_grp = vim.api.nvim_create_augroup

local yank_group = new_au_grp('HighlightYank', {})
new_au_cmd('TextYankPost', {
  group = yank_group,
  callback = function()
    vim.highlight.on_yank({
      higroup = 'TermCursor',
      timeout = 60,
    })
  end,
})

local help_group = new_au_grp('HelpNav', {})
new_au_cmd('FileType', {
  group = help_group,
  pattern = 'help',
  callback = function()
    vim.keymap.set("n", "gd", "<C-]>")
  end,
})

local lsp_highlight_group = new_au_grp('LspHighlight', {})
Module = {}
function Module.activate_lsp_highlight()
  new_au_cmd('CursorHold, CursorHoldI', {
    group = lsp_highlight_group,
    pattern = '<buffer>',
    callback = function()
      vim.lsp.buf.document_highlight()
    end,
  })
  new_au_cmd('CursorMoved, CursorMovedI', {
    group = lsp_highlight_group,
    pattern = '<buffer>',
    callback = function()
      vim.lsp.buf.clear_references()
    end,
  })
end

function Module.create_format_on_save_cmd()
  return new_au_cmd('BufWritePre', {
    callback = function()
      vim.lsp.buf.formatting_sync()
    end
  })
end

return Module
