local list = require("plug_list")
local plugins = {
  list.UI,
  list.file_viewers,
  list.git,
  list.parens,
  list.misc,
  list.lsp,
  list.cmp,
  { "EricDriussi/aucmd-toggle.nvim" },
  { "EricDriussi/remember-me.nvim", config = true },
  -- Needed for other plugins
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "kyazdani42/nvim-web-devicons" },
}

local setup = {
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

require("lazy").setup(plugins, setup)
