return {
  mappings = function(actions)
    return {
      i = {
        ["<C-i>"] = actions.cycle_history_next,
        ["<C-o>"] = actions.cycle_history_prev,
        ["<Esc>"] = actions.close,
        ["<C-w>"] = actions.close,
        ["<C-c>"] = actions.close,
        ["<C-h>"] = actions.select_horizontal,
        ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
      },

      n = {
        ["<C-w>"] = actions.close,
        ["<C-c>"] = actions.close,
        ["<C-h>"] = actions.select_horizontal,
        ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["J"] = actions.move_selection_next,
        ["K"] = actions.move_selection_previous,
      },
    }
  end,

  commands = function()
    return {
      { "<leader>f", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "Find File" },
      { "<leader>F", LazyVim.pick("live_grep"), desc = "Find in Files" },
      { "<leader>F", LazyVim.pick("grep_string"), mode = "v", desc = "Find Selection" },

      { "<C-b>", "<cmd>Telescope lsp_references<cr>", desc = "References" },
      { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
      { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
      { "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
      { "gE", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Goto (ALL) Errors" },

      { "<C-Space>", "<cmd>Telescope spell_suggest<cr>", "Spelling" },

      { "<leader>A", "<cmd>Telescope commands<cr>", desc = "Actions" },
      { "<leader>H", "<cmd>Telescope help_tags<cr>", desc = "Help" },
      { "<leader>R", "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "<leader>gr", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
    }
  end,
}
