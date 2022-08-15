require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  sync_install = false,
  highlight = {
    enable = true,
  },
  indent = { enable = true, disable = { "yaml" } },

  -- Plugins!
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1500, -- Do not enable for files with more than n lines, int
  },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
}
