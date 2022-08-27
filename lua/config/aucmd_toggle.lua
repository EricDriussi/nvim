-- assumes the aucmds already exist
-- TODO.accept callbacks in aucmd, nvim_get_autocmds only handles commands
-- TODO.refactor?

local aucmds_in_group = {}
vim.api.nvim_create_user_command(
  "ToggleAucmdsByGroup",
  function(input)
    local given_group = input.args
    local existing_aucmds = vim.api.nvim_get_autocmds({ group = given_group })
    if aucmds_in_group[given_group] == nil then
      aucmds_in_group[given_group] = {}
    end

    if next(existing_aucmds) == nil then
      for _, cmd in pairs(aucmds_in_group[given_group]) do
        vim.api.nvim_create_autocmd(cmd.event, {
          desc = cmd.desc,
          group = cmd.group_name,
          command = cmd.command
        })
        print(cmd.desc .. " turned ON")
      end
      aucmds_in_group[given_group] = {}

    else
      for _, cmd in pairs(existing_aucmds) do
        table.insert(aucmds_in_group[given_group], cmd)
        vim.api.nvim_del_autocmd(cmd.id)
        print(cmd.desc .. " turned OFF")
      end
    end

  end,
  {
    desc = "Global toggle for given augroup",
    nargs = 1
  }
)

local aucmds_for_event = {}
vim.api.nvim_create_user_command(
  "ToggleAucmdsByEvent",
  function(input)
    local given_event = input.args
    local existing_aucmds = vim.api.nvim_get_autocmds({ group = given_event })
    if aucmds_for_event[given_event] == nil then
      aucmds_for_event[given_event] = {}
    end

    if next(existing_aucmds) == nil then
      for _, cmd in pairs(aucmds_for_event[given_event]) do
        vim.api.nvim_create_autocmd(cmd.event, {
          desc = cmd.desc,
          group = cmd.group_name,
          command = cmd.command
        })
        print(cmd.desc .. " turned ON")
      end
      aucmds_for_event[given_event] = {}

    else
      for _, cmd in pairs(existing_aucmds) do
        table.insert(aucmds_for_event[given_event], cmd)
        vim.api.nvim_del_autocmd(cmd.id)
        print(cmd.desc .. " turned OFF")
      end
    end
  end,
  {
    desc = "Global toggle for aucmds for given event",
    nargs = 1
  }
)
