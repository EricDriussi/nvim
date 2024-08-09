Map = vim.keymap.set
Nmap = function(lhs, rhs, opts)
  Map("n", lhs, rhs, opts or {})
end

return {
  from_lazyvim = require("keys.lazyvim"),
  custom = require("keys.custom"),

  cmp = require("keys.cmp"),
  telescope = require("keys.telescope"),
  git = require("keys.git"),
  neo_tree = require("keys.neo_tree"),
  copilot = require("keys.copilot"),

  comment = {
    { "<leader>/", mode = { "n" }, "<cmd>CommentToggle<cr>", desc = "Toggle Comment" },
    { "<leader>/", mode = { "x" }, ":'<,'>CommentToggle<cr>", silent = true, desc = "Toggle Comment" },
  },

  lsp = {
    { "rN", LazyVim.lsp.rename_file },
    { "rn", vim.lsp.buf.rename },
    { "<c-k>", vim.lsp.buf.signature_help },
    { "<M-cr>", LazyVim.lsp.action.source },
  },

  grug = {
    {
      "<leader>S",
      function()
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        require("grug-far").grug_far({
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

  none = function()
    return {}
  end,
}
