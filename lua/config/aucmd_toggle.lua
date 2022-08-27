local aucmds = {}

-- assumes the aucmds already exist
-- TODO.accept callbacks in aucmd, nvim_get_autocmds only handles commands
-- TODO.refactor
vim.api.nvim_create_user_command(
  "ToggleAucmdsByGroup",
  function(input)
    local augroup_to_toggle = input.args
    local aucmds_in_group = vim.api.nvim_get_autocmds({ group = augroup_to_toggle })

    -- no aucmds found in group
    if next(aucmds_in_group) == nil then
      for _, cmd in pairs(aucmds) do
        vim.api.nvim_create_autocmd(cmd.event, {
          desc = cmd.desc,
          group = cmd.group_name,
          command = cmd.command
        })
        print(cmd.desc .. " turned ON")
      end
      aucmds = {}

      -- aucmd founds
    else
      for _, cmd in pairs(aucmds_in_group) do
        table.insert(aucmds, cmd)
        vim.api.nvim_del_autocmd(cmd.id)
        print(cmd.desc .. " turned OFF")
      end
    end
  end,
  {
    desc = "Global toggle for given aucmd",
    nargs = 1
  }
)
