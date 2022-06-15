local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {

  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  respect_buf_cwd = true,
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
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
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = true,
    side = "left",
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "<C-h>", cb = tree_cb "split" },
        { key = "<C-v>", cb = tree_cb "vsplit" },
        { key = "<C-t>", cb = tree_cb "tabnew" },
        { key = "a", cb = tree_cb "create" },
        { key = "d", cb = tree_cb "remove" },
        { key = "D", cb = tree_cb "trash" },
        { key = "r", cb = tree_cb "rename" },
        { key = "<C-r>", cb = tree_cb "full_rename" },
        { key = "x", cb = tree_cb "cut" },
        { key = "y", cb = tree_cb "copy" },
        { key = "p", cb = tree_cb "paste" },
        { key = "yn", cb = tree_cb "copy_name" },
        { key = "yp", cb = tree_cb "copy_path" },
        { key = "H", cb = tree_cb "toggle_ignored" },
        { key = "-", action = "" },
      },
    },
    number = false,
    relativenumber = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker ={
        enable = true
      }
    }
  },
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
vim.api.nvim_exec([[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]], false)
