require("bufferline").setup {
  options = {
    -- Tab like usual
    mode = "tabs",
    -- Show errors on tabs
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function()
      return " "
    end,

    indicator = {
      style = "none"
    },

    -- Offset file explorer
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer", -- Consider exposing root dir and displaying it here
        highlight = "Directory",
        text_align = "center"
      }
    },
  }
}
