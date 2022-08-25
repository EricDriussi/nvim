local which_key = require("which-key")

local setup = {
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
}

local opts_base = {
  mode = "n",
  -- Buffer specific?
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings_base = {
  ["<C-Space>"] = { "<Cmd>Telescope spell_suggest<CR>", "Spelling" },
  ["<C-b>"] = { "<Cmd>Telescope lsp_references<CR>", "Show References" },
  ["<C-k>"] = { "<Cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature" },
  ["<M-CR>"] = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
  ["<M-b>"] = { "<Cmd>call HorTermToggle()<CR>", "Horizontal Terminal" },
  ["<M-g>"] = { "<Cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
  ["<M-v>"] = { "<Cmd>call VertTermToggle()<CR>", "Vertical Terminal" },
  ["K"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
  ["rn"] = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
}

local opts_leader = {
  mode = "n",
  prefix = "<leader>",
  -- Buffer specific?
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings_leader = {
  ["/"] = { "<plug>NERDCommenterToggle<CR>k", "Comment" },
  ["?"] = { "<Cmd>Mason<CR>", "LSP" },
  ["A"] = { "<Cmd>Telescope commands<CR>", "Actions" },
  ["F"] = { "<Cmd>Telescope live_grep<CR>", "Find String" },
  ["H"] = { "<Cmd>Telescope help_tags<CR>", "Help" },
  ["L"] = { "<Cmd>ToggleFormatOnSave<CR>", "Toggle FOS" },
  ["R"] = { "<Cmd>Telescope registers<CR>", "Registers" },
  ["a"] = { "<Cmd>lua require('harpoon.mark').add_file()<CR>", "Add Harpoon" },
  ["d"] = { "<Cmd>call ToggleDiffMode()<CR>", "Diff Mode" },
  ["e"] = { "<Cmd>NvimTreeToggle<CR>", "Explorer" },
  ["f"] = { "<Cmd>Telescope find_files<CR>", "Find File" },
  ["h"] = { "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoons" },
  ["l"] = { "<Cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
  ["m"] = { "<Cmd>MarkdownPreviewToggle<CR>", "Preview MD" },
  ["s"] = { "<Cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Seek & Destroy" },
  ["S"] = { "<Cmd>vsplit<CR>", "Split Right" },
  ["u"] = { "<Cmd>UndotreeToggle<CR>", "Undo Tree" },

  r = {
    name = 'Refactor',
    f = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
    i = { "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
    r = { "<Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "List Refactors" },
    v = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
  },

  t = {
    name = 'Test',
    n = { "<Cmd>TestNearest<CR>", "Test nearest" },
    t = { "<Cmd>TestLast<CR>", "Test re-run" },
  },

  g = {
    name = "Git",
    A = { "<Cmd>Git blame<CR>", "Git Anotate File" },
    a = { "<Cmd>Gitsigns toggle_current_line_blame<CR>", "Git Anotate Line" },
    b = { "<Cmd>Gitsigns reset_hunk<CR>", "Git Back Hunk" },
    h = { "<Cmd>diffget //2<CR>", "Get From Current (Left)" },
    l = { "<Cmd>diffget //3<CR>", "Get From Incoming (Right)" },
    n = { "<Cmd>Gitsigns next_hunk<CR>", "Next Hunk/Conflict" },
    p = { "<Cmd>Gitsigns prev_hunk<CR>", "Prev Hunk/Conflict" },
    r = { "<Cmd>Telescope git_branches<CR>", "Branches" },
    s = { "<Cmd>Gvdiffsplit<bar>windo set wrap<CR>", "Split" },
  },
}

local opts_visual = {
  mode = "v",
  prefix = "<leader>",
  -- Buffer specific?
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings_visual = {
  ["/"] = { "<plug>NERDCommenterToggle<CR>k", "Comment" },
  ["F"] = { "<Cmd>Telescope grep_string<CR>", "Find String" },
  ["s"] = { "<Esc><Cmd>lua require('spectre').open_visual()<CR>", "Seek & Destroy" },
  r = {
    name = "Refactor",
    e = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
    f = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "Extract To File" },
    i = { "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
    r = { "<Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "List Refactors" },
    v = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
  },
  g = {
    name = "Git",
    b = { "<Cmd>Gitsigns reset_hunk<CR>", "Git Back Hunk" },
    h = { "<Cmd>'<,'>diffget //2<CR>", "Get From Current (Left)" },
    l = { "<Cmd>'<,'>diffget //3<CR>", "Get From Incoming (Right)" },
  },
}

local opts_goto = {
  mode = "n",
  prefix = "g",
  -- Buffer specific?
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings_goto = {
  ["d"] = { "<Cmd>Telescope lsp_definitions<CR>", "Goto Definition" },
  ["e"] = { "<Cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>", "Get Error" },
  ["i"] = { "<Cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
  ["n"] = { "<Cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", "Goto Next Error" },
  ["p"] = { "<Cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", "Goto Prev Error" },
  ["q"] = { "<Cmd>lua vim.diagnostic.setloclist()<CR>", "Diagnostics -> qf list" },
  ["r"] = { "<Cmd>Telescope lsp_references<CR>", "Goto References" },
}

local opts_term_mode = {
  mode = "t",
  -- Buffer specific?
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings_term_mode = {
  ["<M-v>"] = { "<Cmd>call VertTermToggle()<CR>", "Toggle Vertical Terminal" },
  ["<M-b>"] = { "<Cmd>call HorTermToggle()<CR>", "Toggle Horizontal Terminal" },
}

which_key.setup(setup)
which_key.register(mappings_base, opts_base)
which_key.register(mappings_leader, opts_leader)
which_key.register(mappings_visual, opts_visual)
which_key.register(mappings_goto, opts_goto)
which_key.register(mappings_term_mode, opts_term_mode)
