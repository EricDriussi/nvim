local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup {
  ensure_installed = "all",
  sync_install = false,
  highlight = {
    enable = true,
  },
  indent = { enable = true, disable = { "yaml" } },

  -- Plugins!
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }
    extended_mode = true,
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
}
