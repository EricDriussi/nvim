-- assumes the aucmds already exist

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

local function toggle(selection, aucmds)
  if aucmds_by_selection[selection] == nil then
    aucmds_by_selection[selection] = {}
  end

  local cmds_are_set = next(aucmds) ~= nil
  if cmds_are_set then
    turn_off(selection, aucmds)
  else
    turn_on_by(selection)
  end
end

vim.api.nvim_create_user_command(
  "ToggleAucmdsByGroup",
  function(input)
    local augroup = input.args
    local aucmds_by_group = vim.api.nvim_get_autocmds({ group = augroup })
    toggle(augroup, aucmds_by_group)
  end,
  {
    desc = "Global toggle for given augroup",
    nargs = 1
  }
)

vim.api.nvim_create_user_command(
  "ToggleAucmdsByEvent",
  function(input)
    local event = input.args
    local aucmds_by_event = vim.api.nvim_get_autocmds({ event = event })
    toggle(event, aucmds_by_event)
  end,
  {
    desc = "Global toggle for aucmds for given event",
    nargs = 1
  }
)
