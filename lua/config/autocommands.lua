local yank_group = vim.api.nvim_create_augroup('HighlightYank', {})
vim.api.nvim_create_autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'TermCursor',
      timeout = 60,
    })
  end,
})

Module = {}
function Module.activate_lsp_highlight()
  local lsp_highlight_group = vim.api.nvim_create_augroup('LspHighlight', {})
  vim.api.nvim_create_autocmd('CursorHold, CursorHoldI', {
    group = lsp_highlight_group,
    callback = function()
      vim.lsp.buf.document_highlight()
    end,
  })
  vim.api.nvim_create_autocmd('CursorMoved, CursorMovedI', {
    group = lsp_highlight_group,
    callback = function()
      vim.lsp.buf.clear_references()
    end,
  })
end

function Module.create_format_on_save_cmd()
  return vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
      vim.lsp.buf.formatting_sync()
    end
  })
end

return Module
