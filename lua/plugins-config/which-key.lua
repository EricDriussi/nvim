local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

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
  ["K"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
  ["<C-k>"] = { "<Cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature" },
  ["rn"] = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
  ["<C-b>"] = { "<Cmd>Telescope lsp_references<CR>", "Show References" },
  ["<M-CR>"] = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
  ["<C-Space>"] = { "<Cmd>Telescope spell_suggest<CR>", "Spelling" },
  ["<M-b>"] = { "<Cmd>call HorTermToggle()<CR>", "Horizontal Terminal" },
  ["<M-v>"] = { "<Cmd>call VertTermToggle()<CR>", "Vertical Terminal" },
  ["<M-g>"] = { "<Cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
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
  ["u"] = { "<Cmd>UndotreeToggle<CR>", "Undo Tree" },
  ["e"] = { "<Cmd>NvimTreeToggle<CR>", "Explorer" },
  ["m"] = { "<Cmd>MarkdownPreviewToggle<CR>", "Preview MD" },
  ["f"] = { "<Cmd>Telescope git_files<CR>", "Find - Git" },
  ["F"] = { "<Cmd>Telescope live_grep<CR>", "Find - Grep" },
  ["p"] = { "<Cmd>Telescope find_files<CR>", "Find - Files" },
  ["A"] = { "<Cmd>Telescope commands<CR>", "Actions" },
  ["R"] = { "<Cmd>Telescope registers<CR>", "Registers" },
  ["d"] = { "<Cmd>call ToggleDiffMode()<CR>", "Diff Mode" },
  ["l"] = { "<Cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
  ["L"] = { "<Cmd>lua ToggleFormatOnSave()<CR>", "Toggle FOS" },
  ["/"] = { "<plug>NERDCommenterToggle<CR>k", "Comment" },
  ["a"] = { "<Cmd>lua require('harpoon.mark').add_file()<CR>", "Add Harpoon" },
  ["h"] = { "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoons" },
  ["H"] = { "<Cmd>Telescope help_tags<CR>", "Help" },
  ["s"] = { "<Cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Seek & Destroy" },
  ["?"] = { "<Cmd>Mason<CR>", "LSP" },

  r = {
    name = 'Refactor',
    r = { "<Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "List Refactors" },
    f = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
    v = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
    i = { "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
  },

  t = {
    name = 'Test',
    n = { "<Cmd>TestNearest<CR>", "Test nearest" },
    t = { "<Cmd>TestLast<CR>", "Test re-run" },
  },

  g = {
    name = "Git",
    r = { "<Cmd>Telescope git_branches<CR>", "Branches" },
    s = { "<Cmd>Gvdiffsplit<bar>windo set wrap<CR>", "Split" },
    b = { "<Cmd>Gitsigns reset_hunk<CR>", "Git Back Hunk" },
    a = { "<Cmd>Gitsigns toggle_current_line_blame<CR>", "Git Anotate Line" },
    A = { "<Cmd>Git blame<CR>", "Git Anotate File" },
    l = { "<Cmd>diffget //3<CR>", "Get From Incoming (Right)" },
    h = { "<Cmd>diffget //2<CR>", "Get From Current (Left)" },
    n = { "]c", "GoTo Next Conflict" },
    p = { "[c", "GoTo Prev Conflict" },
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
  ["F"] = { "<Cmd>Telescope grep_string<CR>", "Find - Grep" },
  ["s"] = { "<Esc><Cmd>lua require('spectre').open_visual()<CR>", "Seek & Destroy" },
  r = {
    name = "Refactor",
    r = { "<Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "List Refactors" },
    e = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
    f = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "Extract To File" },
    v = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
    i = { "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
  },
  g = {
    name = "Git",
    l = { "<Cmd>diffget //3<CR>", "Get From Incoming (Right)" },
    h = { "<Cmd>diffget //2<CR>", "Get From Current (Left)" },
    n = { "]c", "GoTo Next Conflict" },
    p = { "[c", "GoTo Prev Conflict" },
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
  ["i"] = { "<Cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
  ["r"] = { "<Cmd>Telescope lsp_references<CR>", "Goto References" },
  ["e"] = { "<Cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>", "Get Error" },
  ["n"] = { "<Cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", "Goto Next Error" },
  ["p"] = { "<Cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", "Goto Prev Error" },
  ["q"] = { "<Cmd>lua vim.diagnostic.setloclist()<CR>", "Diagnostics -> qf list" },
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
