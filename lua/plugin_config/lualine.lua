require("lualine").setup {
  options = {
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    --theme = "gruvbox"
    theme = "catppuccin"
  },
  sections = {
    lualine_a = { "mode" },
    --lualine_b = { "filename" },
    --lualine_c = { "branch", "diagnostics" },
    lualine_b = { "branch" },
    lualine_c = { "diagnostics" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
}
