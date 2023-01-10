local list = require("plug_list")
local plugins = {
  -- Needed for other plugins
  { "nvim-lua/popup.nvim",
    priority = 1000,
  },
  { "nvim-lua/plenary.nvim",
    priority = 1000,
  },
  { "kyazdani42/nvim-web-devicons",
    priority = 1000,
  },
  list.UI,
  list.file_viewers,
  list.git,
  list.parens,
  list.misc,
  list.lsp,
  list.cmp,
  { "EricDriussi/aucmd-toggle.nvim" },
  { "EricDriussi/remember-me.nvim", config = true },
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
