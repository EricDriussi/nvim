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
    print('Format On Save OFF')
  else
    Format_on_save_cmd_id = vim.api.nvim_create_autocmd(Command_to_toggle.event, Command_to_toggle.opts)
    print('Format On Save ON')
  end
end
