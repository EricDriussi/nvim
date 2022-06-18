require('bufferline').setup {
  options = {
    mode = "tabs",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function()
      return " ⚠️"
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    },
  }
}
