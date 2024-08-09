return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      panel = { enalbed = false },
      suggestion = {
        auto_trigger = true,
      },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    keys = require("keys").copilot,
  },
}
