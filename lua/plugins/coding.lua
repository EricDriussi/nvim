return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji", "kristijanhusak/vim-dadbod-completion" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
      opts.experimental = { ghost_text = false }
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        cmp.setup.filetype({ "sql", "mysql", "psql" }, {
          sources = {
            { name = "vim-dadbod-completion" },
            { name = "buffer" },
          },
        }),
      })
      opts.formatting = {
        format = function(entry, item)
          local icons = LazyVim.config.icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind]
          end

          item.menu = ({
            nvim_lsp = "[L]",
            path = "[P]",
            buffer = "[B]",
            emoji = "[E]",
            snippets = "[S]",
          })[entry.source.name]

          local widths = {
            abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
            menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
          }

          for key, width in pairs(widths) do
            if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
              item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
            end
          end
          return item
        end,
      }
    end,
  },

  { "folke/ts-comments.nvim", enabled = false },
  {
    "terrortylor/nvim-comment",
    keys = {
      { "<leader>/", mode = { "n" }, "<cmd>CommentToggle<cr>", desc = "Toggle Comment" },
      { "<leader>/", mode = { "x" }, ":'<,'>CommentToggle<cr>", silent = true, desc = "Toggle Comment" },
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
