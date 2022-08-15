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
  vim.api.nvim_create_autocmd('CursorHold', {
    group = lsp_highlight_group,
    callback = function()
      vim.lsp.buf.document_highlight()
    end,
  })
  vim.api.nvim_create_autocmd('CursorMoved', {
    group = lsp_highlight_group,
    callback = function()
      vim.lsp.buf.clear_references()
    end,
  })
end

return Module
