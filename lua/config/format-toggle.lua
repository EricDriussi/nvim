local format_on_save_cmd_id = require("config.autocommands").create_format_on_save_cmd()

function ToggleFormatOnSave()
  if format_on_save_cmd_id ~= 0 then
    vim.api.nvim_del_autocmd(format_on_save_cmd_id)
    format_on_save_cmd_id = 0
    print('Format On Save OFF')
  else
    format_on_save_cmd_id = require("config.autocommands").create_format_on_save_cmd()
    print('Format On Save ON')
  end
end
