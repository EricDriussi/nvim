local which_key = require("which-key")
which_key.setup({

  plugins = {
    marks = false,
    registers = false,
    spelling = {
      enabled = true,
      suggestions = 20,
    },

    -- Help for vim stuff
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = true,
      g = false,
    },

  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },

  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },

  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 80 },
    spacing = 5,
    align = "left",
  },

  -- Ignore keymaps with no label
  ignore_missing = true,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
})

local function default_opts_with(mode, prefix)
  return {
    mode = mode,
    prefix = prefix or "",
    -- Buffer specific?
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  }
end

local mappings = require("plugins.which-key.mappings")
which_key.register(mappings.base, default_opts_with("n"))
which_key.register(mappings.leader, default_opts_with("n", "<leader>"))
which_key.register(mappings.visual, default_opts_with("v", "<leader>"))
which_key.register(mappings.go_to, default_opts_with("n", "g"))
which_key.register(mappings.term, default_opts_with("t"))
which_key.register({
  ["<M-CR>"] = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" }
}, default_opts_with("v"))
