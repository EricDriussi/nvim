-- assumes the aucmds already exist
-- TODO.refactor?

local aucmds_by_selection = {}
local function turn_off(selection, aucmds_to_toggle)
  for _, cmd in pairs(aucmds_to_toggle) do
    table.insert(aucmds_by_selection[selection], cmd)
    vim.api.nvim_del_autocmd(cmd.id)
    print(cmd.desc .. " turned OFF")
  end
end

local function turn_on_by(selection)
  for _, cmd in pairs(aucmds_by_selection[selection]) do
    vim.api.nvim_create_autocmd(cmd.event, {
      desc = cmd.desc,
      group = cmd.group_name,
      callback = cmd.callback
    })
    print(cmd.desc .. " turned ON")
  end
  aucmds_by_selection[selection] = {}
end

vim.api.nvim_create_user_command(
  "ToggleAucmdsByGroup",
  function(input)
    local augroup = input.args
    if aucmds_by_selection[augroup] == nil then
      aucmds_by_selection[augroup] = {}
    end

    local aucmds_to_toggle = vim.api.nvim_get_autocmds({ group = augroup })
    local cmds_are_set = next(aucmds_to_toggle) ~= nil
    if cmds_are_set then
      turn_off(augroup, aucmds_to_toggle)
    else
      turn_on_by(augroup)
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
          callback = cmd.callback
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
