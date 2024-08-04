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
    keys = {
      { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
      { "<leader>a", "", desc = "+AI", mode = { "n", "v" } },
      {
        "<leader>ac",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "AI Chat",
        mode = { "n", "v" },
      },
      {
        "<leader>ar",
        function()
          return require("CopilotChat").reset()
        end,
        desc = "AI Reset",
        mode = { "n", "v" },
      },
      {
        "<leader>aa",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end,
        desc = "Ask AI",
        mode = { "n", "v" },
      },
    },
  },
}
