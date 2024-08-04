return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
          require("telescope").load_extension("frecency")
        end,
      },
    },

    opts = function()
      local actions = require("telescope.actions")

      local custom_ivy = {
        theme = "ivy",
        layout_config = { height = 0.35 },
        initial_mode = "normal",
      }
      local no_prev_dropdown = { theme = "dropdown", previewer = false }

      return {
        defaults = {
          prompt_prefix = "🔎 ",
          selection_caret = " ⮚ ",
          path_display = { "smart" },
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
            width = 0.90,
          },

          mappings = {
            i = {
              ["<C-i>"] = actions.cycle_history_next,
              ["<C-o>"] = actions.cycle_history_prev,
              ["<Esc>"] = actions.close,
              ["<C-w>"] = actions.close,
              ["<C-h>"] = actions.select_horizontal,
              ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
            n = {
              ["<C-w>"] = actions.close,
              ["<C-h>"] = actions.select_horizontal,
              ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
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

    keys = function()
      return {
        { "<leader>f", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "Find File" },
        { "<leader>F", LazyVim.pick("live_grep"), desc = "Find in Files" },
        { "<leader>F", LazyVim.pick("grep_string"), mode = "v", desc = "Find Selection" },

        { "<C-b>", "<cmd>Telescope lsp_references<cr>", "References" },
        { "gr", "<cmd>Telescope lsp_references<cr>", "References" },
        { "gd", "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
        { "gi", "<cmd>Telescope lsp_implementations<cr>", "Goto Implementation" },
        { "gE", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Goto (ALL) Errors" },

        { "<C-Space>", "<cmd>Telescope spell_suggest<cr>", "Spelling" },

        { "<leader>A", "<cmd>Telescope commands<cr>", "Actions" },
        { "<leader>H", "<cmd>Telescope help_tags<cr>", "Help" },
        { "<leader>R", "<cmd>Telescope registers<cr>", "Registers" },
        { "<leader>gr", "<cmd>Telescope git_branches<cr>", "Branches" },
      }
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    -- replace all LazyVim keymaps
    keys = function()
      return {
        {
          "<leader>e",
          function()
            require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
          end,
          desc = "Explorer",
        },
      }
    end,

    opts = {
      close_if_last_window = true,

      event_handlers = {
        {
          event = "after_render",
          handler = function()
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

      window = {
        width = 30,
        mappings = {
          ["<c-t>"] = "open_tabnew",
          ["<c-h>"] = "open_split",
          ["<c-v>"] = "open_vsplit",
          ["l"] = "open",
          ["h"] = "close_node",
          ["<cr>"] = "open",
          ["/"] = "none",
          ["y"] = "none",
          ["yy"] = "copy_to_clipboard",
          ["yp"] = function(state)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local rel_filepath = vim.fn.fnamemodify(filepath, ":.")
            vim.fn.setreg("+", rel_filepath)
            print('Copied "' .. rel_filepath .. '" to system clipboard')
          end,
          ["yn"] = function(state)
            local file = state.tree:get_node()
            vim.fn.setreg("+", file.name)
            print('Copied "' .. file.name .. '" to system clipboard')
          end,
        },
      },
    },
  },
  {

    "MagicDuck/grug-far.nvim",
    keys = {
      {
        "<leader>S",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.grug_far({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Seek & Destroy",
      },
    },
  },

  {
    "folke/flash.nvim",
    enabled = false,
  },

  {
    -- TODO: checkhealth - conflicting keymaps
    "folke/which-key.nvim",
    keys = function()
      return {}
    end,
    opts = {
      preset = "modern",
      layout = {
        width = { min = 20, max = 80 },
        spacing = 5,
      },
      -- TODO: once review is done, uncomment to reduce noise
      --       plugins = {
      --         marks = false,
      --         registers = false,
      --
      --         -- Help for vim stuff
      --         presets = {
      --           operators = false,
      --           motions = false,
      --           text_objects = false,
      --           windows = false,
      --           nav = false,
      --           z = true,
      --           g = false,
      --         },
      -- 		},
      spec = {
        {
          mode = { "n", "v" },
          -- TODO: take what needed and remove rest
          { "<leader>c", group = "code" },
          { "<leader>g", group = "git" },
          { "<leader>gh", group = "hunks" },
          { "<leader>s", group = "search" },
          { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
          { "g", group = "goto" },
          { "z", group = "fold" },
        },
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
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map("n", "<leader>gn", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "<leader>gp", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev Hunk")

        map("n", "<leader>gb", gs.reset_hunk, "Git Back Hunk")
        map("n", "<leader>gB", gs.reset_buffer, "Git Back File")
        map("n", "<leader>ga", gs.blame_line, "Git Anotate Line")
        map("n", "<leader>gA", gs.blame, "Git Anotate File")
      end,
    },
  },

  {
    "folke/trouble.nvim",
    enabled = false,
  },

  {
    -- TODO: seems overkill, eval if worth it
    "folke/todo-comments.nvim",
    enabled = false,
  },
}
