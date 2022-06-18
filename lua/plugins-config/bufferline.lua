local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    -- Tab like usual
    mode = "tabs",
    -- Show errors on tabs
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function()
      return " ⚠️"
    end,
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
