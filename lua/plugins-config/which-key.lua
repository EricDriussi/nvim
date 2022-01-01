local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  key_labels = {
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 80 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["u"] = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["/"] = { "<cmd>call nerdcommenter#Comment(0, 'toggle')<CR>", "Tgl Comment" },
  ["m"] = { "<cmd>MarkdownPreviewToggle<cr>", "Preview MD" },
  ["s"] = { "<cmd>Telescope spell_suggest<cr>", "Spelling" },
  ["r"] = { "rp *``cgn", "Dumb Replace" },

  g = {
    name = "Git",
    s = { "<cmd>Gvdiffsplit<bar>windo set wrap<CR>", "Split" },
    b = { "<cmd>Gitsigns reset_hunk<CR>", "Git Back Hunk" },
    l = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "bLame Line" },
    L = { "<cmd>Git blame<CR>", "bLame File" },
  },

  t = {
    name = "Terminal",
    t = { "<cmd>ToggleTerm<CR>", "Toggle" },
    s = { "<cmd>lua _SML_TOGGLE()<CR>", "SML REPL" },
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Git-Lazy" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },

  f = {
    name = "Find Stuff",
    f = { "<cmd>Telescope git_files<cr>", "Files - <LDR>f" },
    F = { "<cmd>Telescope live_grep<cr>", "Grep Files - <LDR>F" },
    A = { "<cmd>Telescope commands<cr>", "Actions - <LDR>A" },
    r = { "<cmd>Telescope registers<cr>", "Registers - <LDR>r" },
    sf = { "<cmd>lua require'telescope.builtin'.find_files{ cwd = '~/' }<CR>", "Suer Find - <LDR>sf" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action - <A-cr>" },
    d = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "GoTo Declaration - gD"},
    D = {"<cmd>lua vim.lsp.buf.definition()<CR>", "GoTo Definition - gd"},
    i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "GoTo Implementation - gi"},
    r = {"<cmd>lua vim.lsp.buf.references()<CR>", "GoTo References - gr"},
    R = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Rename - rn"},
    h = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Hover - K"},
    H = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Help - <C-k>"},
    e = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" )}<cr>', "GoTo Error in Line - ge"},
    n = {'<cmd>lua vim.diagnostic.goto_next({ border = "rounded" )}<cr>', "Goto Next Error - <LDR>n"},
    p = {'<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" )}<cr>', "Goto Prev Error - <LDR>p"},
    q = {"<cmd>lua vim.diagnostic.setloclist()<CR>", "Send to QuickFix - <LDR>q"},
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },

    },
}

which_key.setup(setup)
which_key.register(mappings, opts)
