-- Completion
require("plugins-config.core.cmp")
-- LSP
require("plugins-config.lsp")
-- Telescopic
require("plugins-config.telescope")
-- Treesitter
require("plugins-config.core.treesitter")
-- Gitsigns
require("plugins-config.gitsigns")
-- ToggleTerm
require("plugins-config.toggleterm")
-- WhichKey
require("plugins-config.which-key")
-- NvimTree
require("plugins-config.nvim-tree")
-- Autopairs
require("plugins-config.autopairs")
-- Null-ls
require("plugins-config.core.null-ls")
-- Lualine
require("plugins-config.lualine")
-- Bufferline
require("plugins-config.bufferline")
-- Pretty QFList
require('pqf').setup()
-- Harpoon
require("harpoon").setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 70,
  }
})

require("spectre").setup({
  line_sep_start = '',
  result_padding = '│  ',
  line_sep = '',
  default = {
    find = {
      cmd = 'rg',
      options = {}
    }
  }
})

Command_to_toggle = {
  event = 'BufWritePre', opts = {
    pattern = '*',
    command = 'lua vim.lsp.buf.formatting_sync()'
  }
}

Format_on_save_cmd_id = vim.api.nvim_create_autocmd(Command_to_toggle.event, Command_to_toggle.opts)

function ToggleFormatOnSave()
  if Format_on_save_cmd_id ~= 0 then
    vim.api.nvim_del_autocmd(Format_on_save_cmd_id)
    Format_on_save_cmd_id = 0
  else
    Format_on_save_cmd_id = vim.api.nvim_create_autocmd(Command_to_toggle.event, Command_to_toggle.opts)
  end
end
