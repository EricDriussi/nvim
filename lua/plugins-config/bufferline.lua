require("bufferline").setup {
  options = {
    -- Tab like usual
    mode = "tabs",
    -- Show errors on tabs
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function()
      return " ⚠️"
    end,

    indicator_icon = '',

    -- Offset file explorer
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
