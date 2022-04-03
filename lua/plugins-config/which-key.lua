local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
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
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
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
    spacing = 5, -- spacing between columns
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

local opts_base = {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings_base = {
  ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
  ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature" },
  ["rn"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
  ["<A-CR>"] = { "<cmd>Telescope lsp_code_actions<cr><Esc>", "Code Actions" },
  ["<C-Space>"] = { "<cmd>Telescope spell_suggest<cr><Esc>", "Spelling" },
  ["<a-h>"] = { "<cmd>call TermToggle(15)<CR>", "Horizontal Terminal" },

  ["<a-g>"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
  ["<a-s>"] = { "<cmd>lua _SML_TOGGLE()<CR>", "SML REPL" },
  ["<a-n>"] = { "<cmd>lua _NODE_TOGGLE()<CR>", "Node REPL" },
}

local opts_leader = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings_leader = {
  ["u"] = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["m"] = { "<cmd>MarkdownPreviewToggle<cr>", "Preview MD" },
  ["f"] = { "<cmd>Telescope git_files<cr>", "Find - Git" },
  ["F"] = { "<cmd>Telescope live_grep<cr>", "Find - Grep" },
  ["A"] = { "<cmd>Telescope commands<cr>", "Actions" },
  ["R"] = { "<cmd>Telescope registers<cr><esc>", "Registers" },
  ["M"] = { "<cmd>Telescope marks<cr><esc>", "Marked Lines" },
  ["d"] = { "<cmd>call DiffMe()<CR>", "Diff Mode" },
  ["l"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
  ["/"] = { "<plug>NERDCommenterToggle<CR>k", "Comment" },

  g = {
    name = "Git",
    r = { "<cmd>Telescope git_branches<cr><esc>", "Branches" },
    s = { "<cmd>Gvdiffsplit<bar>windo set wrap<CR>", "Split" },
    b = { "<cmd>Gitsigns reset_hunk<CR>", "Git Back Hunk" },
    a = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Git Anotate Line" },
    A = { "<cmd>Git blame<CR>", "Git Anotate File" },
    l = { "<cmd>diffget //3<CR>", "Get From Incoming (Right)" },
    h = { "<cmd>diffget //2<CR>", "Get From Current (Left)" },
    n = { "]c", "GoTo Next Conflict" },
    p = { "[c", "GoTo Prev Conflict" },
  },
}

local opts_visual = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings_visual = {
  ["/"] = { "<plug>NERDCommenterToggle<CR>k", "Comment" },
  ["F"] = { "<cmd>Telescope grep_string<cr><esc>", "Find - Grep" },
    r = {
    name = "Refactor",
      r = { "<cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "List Refactors" },
      e = { "<cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
      f = { "<cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "Extract To File" },
      v = { "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
      i = { "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
    }
}

local opts_goto = {
  mode = "n",
  prefix = "g",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings_goto = {
  ["d"] = { "<cmd>Telescope lsp_definitions<CR><Esc>", "Goto Definition" },
  ["D"] = { "<cmd>Telescope lsp_declaration<CR><Esc>", "Goto Declaration" },
  ["i"] = { "<cmd>Telescope lsp_implementations<cr><Esc>", "Goto Implementation" },
  ["r"] = { "<cmd>Telescope lsp_references<cr><Esc>", "Goto References" },
  ["e"] = { "<cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>", "Get Error" },
  ["n"] = { "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", "Goto Next Error" },
  ["p"] = { "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", "Goto Prev Error" },
  ["q"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Diagnostics -> qf list" },
}


which_key.setup(setup)
which_key.register(mappings_base, opts_base)
which_key.register(mappings_leader, opts_leader)
which_key.register(mappings_visual, opts_visual)
which_key.register(mappings_goto, opts_goto)
