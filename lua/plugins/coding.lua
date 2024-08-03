return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  { "folke/ts-comments.nvim", enabled = false },
  {
    "terrortylor/nvim-comment",
    keys = {
      { "<leader>/", mode = { "n", "x" }, "<cmd>CommentToggle<cr><esc>", desc = "Toggle Comment" },
    },
    cmd = "CommentToggle",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          require("ts_context_commentstring").setup({
            enable_autocmd = false,
          })
        end,
      },
    },
    config = function()
      require("nvim_comment").setup({
        create_mappings = false,
        comment_empty = false,
        hook = function()
          require("ts_context_commentstring").update_commentstring()
        end,
      })
    end,
  },
}
