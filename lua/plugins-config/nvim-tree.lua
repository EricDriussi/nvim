require("nvim-tree").setup {
  disable_netrw = true,

  -- Show errors in files
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },

  -- Follow open file
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },

  -- What to show (or not)
  filters = {
    dotfiles = true,
    custom = { '^\\.git' }
  },

  -- Behavior
  actions = {
    open_file = {
      quit_on_open = false,
      window_picker = {
        enable = true
      }
    }
  },

  -- Location & Dimentions
  view = {
    adaptive_size = true,
    width = 30,
    height = 30,
    hide_root_folder = true,
    side = "left",

    -- Mappings
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, action = "edit" },
        { key = "h", action = "close_node" },
        { key = "<C-h>", action = "split" },
        { key = "<C-v>", action = "vsplit" },
        { key = "<C-t>", action = "tabnew" },
        { key = "a", action = "create" },
        { key = "dd", action = "remove" },
        { key = "D", action = "trash" },
        { key = "r", action = "rename" },
        { key = "R", action = "full_rename" },
        { key = "x", action = "cut" },
        { key = "p", action = "paste" },
        { key = "yf", action = "copy" },
        { key = "yn", action = "copy_name" },
        { key = "yp", action = "copy_path" },
        { key = "H", action = "toggle_dotfiles" },
        { key = "?", action = "toggle_help" },
        { key = "-", action = "" },
        { key = "y", action = "" },
      },
    },
  },

  -- UI
  renderer = {
    root_folder_modifier = ":t",
    highlight_git = true,
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },

      -- Icons
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      }
    }
  },
}
