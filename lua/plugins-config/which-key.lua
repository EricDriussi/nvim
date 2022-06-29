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
  ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
  ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature" },
  ["rn"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
  ["<A-CR>"] = { "<cmd>lua vim.lsp.buf.code_action()<cr><Esc>", "Code Actions" },
  --["<C-Space>"] = { "<cmd>Telescope spell_suggest<cr><Esc>", "Spelling" },
  ["<C-Space>"] = { " <cmd>lua require'telescope.builtin'.spell_suggest({layout_strategy = 'cursor', layout_config = {width = 35, height = 0.4}})<CR>", "Spelling" },
  ["<a-b>"] = { "<cmd>call HorTermToggle()<CR>", "Horizontal Terminal" },
  ["<a-v>"] = { "<cmd>call VertTermToggle()<CR>", "Vertical Terminal" },
  ["<a-g>"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
  ["<a-n>"] = { "<cmd>lua _NODE_TOGGLE()<CR>", "Node REPL" },
  ["<leader>sf"] = { "<cmd>Telescope find_files<CR>", "Super Find" },
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
  ["t"] = { "<cmd> :TestNearest<CR>", "Test nearest" },
  ["r"] = { "<cmd> :TestLast<CR>", "Test re-run" },

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
  -- Buffer specific?
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
    r = { "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "List Refactors" },
    e = { "<Esc><cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
    f = { "<Esc><cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "Extract To File" },
    v = { "<Esc><cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
    i = { "<Esc><cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
  }
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
  ["d"] = { "<cmd>Telescope lsp_definitions<CR><Esc>", "Goto Definition" },
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
