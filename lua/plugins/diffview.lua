local actions = require("diffview.actions")
require("diffview").setup({
  file_history_panel = {
    win_config = {
      position = "bottom",
      height = 10,
    },
  },

  keymaps = {
    file_panel = {
      { "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel." } },
    },
    file_history_panel = {
      { "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel." } },
    },
    view = {
      { "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel." } },
      { "n", "<leader>gh", actions.conflict_choose("ours"), { desc = "Choose the OURS version of a conflict" } },
      { "n", "<leader>gl", actions.conflict_choose("theirs"), { desc = "Choose the THEIRS version of a conflict" } },
      { "n", "<leader>gj", actions.conflict_choose("base"), { desc = "Choose the BASE version of a conflict" } },
    },
  }
})
