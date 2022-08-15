local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'TermCursor',
      timeout = 40,
    })
  end,
})

Module = {}
function Module.activate_lsp_highlight()
  local lsp_highlight_group = augroup('LspHighlight', {})
  autocmd('CursorHold', {
    group = lsp_highlight_group,
    pattern = '<buffer>',
    callback = function()
      vim.lsp.buf.document_highlight()
    end,
  })
  autocmd('CursorHoldI', {
    group = lsp_highlight_group,
    pattern = '<buffer>',
    callback = function()
      vim.lsp.buf.document_highlight()
    end,
  })
  autocmd('CursorMoved', {
    group = lsp_highlight_group,
    pattern = '<buffer>',
    callback = function()
      vim.lsp.buf.clear_references()
    end,
  })
end

return Module
