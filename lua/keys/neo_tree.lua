return {
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
  mappings = {
    ["<c-t>"] = "open_tabnew",
    ["<c-h>"] = "open_split",
    ["<c-v>"] = "open_vsplit",
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
}
