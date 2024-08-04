local none = function()
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    keys = none,
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Enter>",
          node_incremental = "<Enter>",
          node_decremental = "<BS>",
        },
      },

      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["am"] = "@function.outer",
            ["im"] = "@function.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["ac"] = "@call.outer",
            ["ic"] = "@call.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- register in jump list
          goto_next_start = {
            ["m"] = "@function.outer",
          },
          goto_previous_start = {
            ["M"] = "@function.outer",
          },
        },
      },
    },
  },
}
