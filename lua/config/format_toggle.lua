local augroup_to_toggle = "FormatOnSaveGroup"
local first_aucmd

local toggle_augroup = function()
  local aucmds_in_group = vim.api.nvim_get_autocmds({ group = augroup_to_toggle })

  -- no aucmds found in group
  if next(aucmds_in_group) == nil then
    vim.api.nvim_create_autocmd(first_aucmd.event, {
      desc = first_aucmd.desc,
      group = first_aucmd.group_name,
      command = first_aucmd.command
    })
    print(first_aucmd.desc .. " turned ON")

    -- aucmd founds
  else
    first_aucmd = aucmds_in_group[1]
    vim.api.nvim_del_autocmd(first_aucmd.id)
    print(first_aucmd.desc .. " turned OFF")
  end
end

-- assumes there is only one aucmd in FormatOnSaveGroup
-- TODO.refactor
vim.api.nvim_create_user_command(
  "ToggleFormatOnSave",
  toggle_augroup,
  {
    desc = "Global toggle for given aucmd"
  }
)
