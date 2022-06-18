local status_ok, nvimTree = pcall(require, "nvim-tree")
if not status_ok then
  return
end
local tree_cb = require 'nvim-tree.config'.nvim_tree_callback

nvimTree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  -- Follow open file
  update_cwd = false,
  respect_buf_cwd = false,
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
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
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  -- What to show (or not)
  filters = {
    custom = { '^\\.git' }
  },
  -- Location & Dimentions
  view = {
    adaptive_size = true,
    width = 30,
    height = 30,
    hide_root_folder = true,
    side = "left",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "<C-h>", cb = tree_cb "split" },
        { key = "<C-v>", cb = tree_cb "vsplit" },
        { key = "<C-t>", cb = tree_cb "tabnew" },
        { key = "a", cb = tree_cb "create" },
        { key = "d", cb = tree_cb "remove" },
        { key = "D", cb = tree_cb "trash" },
        { key = "rn", cb = tree_cb "rename" },
        { key = "<C-r>", cb = tree_cb "full_rename" },
        { key = "x", cb = tree_cb "cut" },
        { key = "y", cb = tree_cb "copy" },
        { key = "p", cb = tree_cb "paste" },
        { key = "yn", cb = tree_cb "copy_name" },
        { key = "yp", cb = tree_cb "copy_path" },
        { key = "-", action = "" },
      },
    },
  },
  -- Behavior
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = true
      }
    }
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
      }
    }
  },
}

-- Icons
vim.g.nvim_tree_icons = {
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

-- Magic trick to make nvim-tree auto-close
vim.api.nvim_exec([[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
  , false)
