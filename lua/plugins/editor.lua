local function merge_hl(from, into)
  vim.api.nvim_set_hl(0, into, {
    fg = from.fg,
    bg = from.bg,
    bold = from.bold,
    italic = from.italic,
    underline = from.underline,
    undercurl = from.undercurl,
    reverse = from.reverse,
    standout = from.standout,
    strikethrough = from.strikethrough,
    sp = from.sp,
  })
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
          require("telescope").setup({
            extensions = {
              frecency = {
                matcher = "fuzzy",
              },
            },
          })

          require("telescope").load_extension("frecency")
        end,
      },
    },

    keys = require("keys").telescope.commands,
    opts = function()
      local custom_ivy = {
        theme = "ivy",
        layout_config = { height = 0.35 },
        initial_mode = "normal",
      }
      local no_prev_dropdown = { theme = "dropdown", previewer = false }

      return {
        defaults = {
          mappings = require("keys").telescope.mappings(require("telescope.actions")),
          prompt_prefix = "🔎 ",
          selection_caret = " ⮚ ",
          path_display = { "smart" },
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
            width = 0.90,
          },
        },

        pickers = {
          spell_suggest = {
            theme = "cursor",
            layout_config = { width = 0.25 },
            initial_mode = "normal",
          },
          lsp_definitions = custom_ivy,
          lsp_implementations = custom_ivy,
          lsp_references = custom_ivy,
          commands = no_prev_dropdown,
          registers = no_prev_dropdown,
          git_branches = no_prev_dropdown,
        },
      }
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = require("keys").neo_tree.keys,

    opts = {
      close_if_last_window = true,
      window = {
        width = 30,
        mappings = require("keys").neo_tree.mappings,
      },

      event_handlers = {
        {
          event = "after_render",
          handler = function()
            local hl_normal = vim.api.nvim_get_hl(0, { name = "Normal" })
            merge_hl(hl_normal, "NeoTreeNormal")
            merge_hl(hl_normal, "NeoTreeEndOfBuffer")
          end,
        },
      },

      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },

        components = {
          -- project name as root dir: https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/681#discussioncomment-5429393
          name = function(config, node, state)
            local result = require("neo-tree.sources.filesystem.components").name(config, node, state)
            if node:get_depth() == 1 and node.type ~= "message" then
              result.text = vim.fn.fnamemodify(node.path, ":t")
            end
            return result
          end,
        },
      },
    },
  },

  {
    "folke/which-key.nvim",
    keys = require("keys").none,
    opts = {
      icons = { mappings = false },
      plugins = {
        marks = false,
        registers = false,

        -- Help for vim stuff
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = false,
          nav = false,
          z = false,
          g = false,
        },
      },

      spec = {
        { "<leader>u", hidden = true },
        { "<leader>s", hidden = true },
        { "<leader>t", hidden = true },
        { "<leader>w", hidden = true },
        { "<leader>c", hidden = true },
        { "<leader>b", hidden = true },
        { "gc", hidden = true },
        { "gK", hidden = true },
        { "gx", hidden = true },
        { "g]", hidden = true },
        { "g[", hidden = true },
        { "gy", hidden = true },
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        delete = { text = "▎" },
        topdelete = { text = "▎" },
      },
      on_attach = function(buffer)
        require("keys").git(buffer)
      end,
    },
  },

  {
    "mg979/vim-visual-multi",
    config = function()
      -- MultiCursor behave like intelliJ
      vim.g.VM_custom_remaps = { N = "Q" }
    end,
  },

  {
    "MagicDuck/grug-far.nvim",
    keys = require("keys").grug,
  },
}
