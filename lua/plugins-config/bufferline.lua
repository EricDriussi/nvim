require('bufferline').setup {
  options = {
    mode = "tabs",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function()
      return " ⚠️"
    end,
  }
}
