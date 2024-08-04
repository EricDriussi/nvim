return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji", "kristijanhusak/vim-dadbod-completion" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
      opts.experimental = { ghost_text = false }

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      local cmp = require("cmp")

      opts.mapping = {
        cmp.setup.filetype({ "sql", "mysql", "psql" }, {
          sources = {
            { name = "vim-dadbod-completion" },
            { name = "buffer" },
          },
        }),

        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = LazyVim.cmp.confirm({ select = true }),
        ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          local copilot_ok, copilot_suggestion = pcall(require, "copilot.suggestion")
          if vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif copilot_ok and copilot_suggestion.is_visible() then
            copilot_suggestion.accept()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          local copilot_ok, copilot_suggestion = pcall(require, "copilot.suggestion")
          if vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          elseif copilot_ok and copilot_suggestion.is_visible() then
            copilot_suggestion.next()
          else
            fallback()
          end
        end, { "i", "s" }),
      }

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
