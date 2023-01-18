return {
  base = {
    ["<C-Space>"] = { "<Cmd>Telescope spell_suggest<CR>", "Spelling" },
    ["<C-b>"] = { "<Cmd>Telescope lsp_references<CR>", "Show References" },
    ["<C-g>"] = { "<Cmd>lua require\"nvim-git-link\".get_remote_link{ copy = true }<CR><Cmd>echo 'Copied GH link to system clipboard!'<CR>",
      "Copy GH link" },
    ["<C-k>"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["<M-CR>"] = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
    ["<M-b>"] = { "<Cmd>call terminal#ToggleHorizontal()<CR>", "Horizontal Terminal" },
    ["<M-g>"] = { "<Cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    ["<M-v>"] = { "<Cmd>call terminal#ToggleVertical()<CR>", "Vertical Terminal" },
    ["rn"] = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
  },

  leader = {
    ["/"] = { "<plug>NERDCommenterToggle<CR>k", "Comment" },
    ["?"] = { "<Cmd>Mason<CR>", "LSP" },
    ["A"] = { "<Cmd>Telescope commands<CR>", "Actions" },
    ["F"] = { "<Cmd>Telescope live_grep<CR>", "Find String" },
    ["H"] = { "<Cmd>Telescope help_tags<CR>", "Help" },
    ["L"] = { "<Cmd>ToggleAucmdsByGroup FormatOnSaveGroup<CR>", "Toggle FOS" },
    ["R"] = { "<Cmd>Telescope registers<CR>", "Registers" },
    ["a"] = { "<Cmd>lua require('harpoon.mark').add_file()<CR>", "Add Harpoon" },
    ["d"] = { "<Cmd>call diffmode#Toggle()<CR>", "Diff Mode" },
    ["e"] = { "<Cmd>NvimTreeToggle<CR>", "Explorer" },
    --["f"] = { "<Cmd>Telescope find_files<CR>", "Find File" },
    ["f"] = { "<Cmd>lua require('telescope').extensions.smart_open.smart_open({cwd_only = true}) <CR>", "Find File" },
    ["h"] = { "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoons" },
    ["l"] = { "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format" },
    ["m"] = { "<Cmd>MarkdownPreviewToggle<CR>", "Preview MD" },
    ["S"] = { "<Cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Seek & Destroy" },

    s = {
      name = "Split",
      v = { "<Cmd>vsplit<CR>", "Split Right" },
      h = { "<Cmd>split<CR>", "Split Down" },
      s = { "<Cmd>SwapSplit<CR>", "Swap" },
    },

    g = {
      name = "Git",
      A = { "<Cmd>Git blame<CR>", "Git Anotate File" },
      a = { "<Cmd>Gitsigns toggle_current_line_blame<CR>", "Git Anotate Line" },
      b = { "<Cmd>Gitsigns reset_hunk<CR>", "Git Back Hunk" },
      --h = { "<Cmd>diffget //2<CR>", "Get From Current (Left)" },
      --l = { "<Cmd>diffget //3<CR>", "Get From Incoming (Right)" },
      n = { "<Cmd>Gitsigns next_hunk<CR>", "Next Hunk/Conflict" },
      p = { "<Cmd>Gitsigns prev_hunk<CR>", "Prev Hunk/Conflict" },
      r = { "<Cmd>Telescope git_branches<CR>", "Branches" },
      s = { "<Cmd>Gvdiffsplit<bar>windo set wrap<CR>", "Split" },
      c = { "<Cmd>DiffviewOpen<CR>", "Pre-Commit Diff" },
      h = { "<Cmd>DiffviewFileHistory %<CR>", "File History" },
    },

    p = {
      name = "Pretty",
      j = { "<Cmd>%!jq<CR>", "Json" },
      c = { "<Cmd>%!column -t<CR>", "Columns" },
    },
  },

  visual = {
    ["/"] = { "<plug>NERDCommenterToggle<CR>k", "Comment" },
    ["F"] = { "<Cmd>Telescope grep_string<CR>", "Find String" },
    ["s"] = { "<Esc><Cmd>lua require('spectre').open_visual()<CR>", "Seek & Destroy" },

    g = {
      name = "Git",
      b = { "<Cmd>Gitsigns reset_hunk<CR>", "Git Back Hunk" },
      h = { "<Cmd>'<,'>diffget //2<CR>", "Get From Current (Left)" },
      l = { "<Cmd>'<,'>diffget //3<CR>", "Get From Incoming (Right)" },
    },

    p = {
      name = "Pretty",
      j = { "<Cmd>'<,'>!jq<CR>", "Json" },
      c = { "<Cmd>'<,'>!column -t<CR>", "Columns" },
    },
  },

  go_to = {
    ["d"] = { "<Cmd>Telescope lsp_definitions<CR>", "Goto Definition" },
    ["e"] = { "<Cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>", "Get Error" },
    ["i"] = { "<Cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
    ["n"] = { "<Cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", "Goto Next Error" },
    ["p"] = { "<Cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", "Goto Prev Error" },
    ["q"] = { "<Cmd>lua vim.diagnostic.setloclist()<CR>", "Diagnostics -> qf list" },
    ["r"] = { "<Cmd>Telescope lsp_references<CR>", "Goto References" },
  },

  term = {
    ["<M-v>"] = { "<Cmd>call terminal#ToggleVertical()<CR>", "Toggle Vertical Terminal" },
    ["<M-b>"] = { "<Cmd>call terminal#ToggleHorizontal()<CR>", "Toggle Horizontal Terminal" },
  }
}
