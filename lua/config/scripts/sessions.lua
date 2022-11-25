local status_ok, rooter = pcall(require, "nvim-rooter")
if not status_ok then
  return
end

local opt = {
  ignored_filetypes = { "man", "gitignore", "gitcommit" },
  session_dir = "~/.cache/nvim_sessions/",
  session_suffix = ".sess.vim"
}

local function is_valid_filetype()
  local ft = vim.bo.filetype
  for _, ift in pairs(opt.ignored_filetypes) do
    if ift == ft then
      return false
    end
  end
  return true
end

local function is_git_project()
  return rooter.get_root() ~= nil
end

local function is_valid_session_env()
  return is_git_project() and is_valid_filetype()

end

local function save()
  return function()
    if is_valid_session_env() then
      os.execute("mkdir -p " .. opt.session_dir)
      local rootPath = rooter.get_root()
      local projectRoot = string.match(rootPath, ".*/(.*)$")
      vim.api.nvim_command("mksession! " .. opt.session_dir .. projectRoot .. opt.session_suffix)
    end
  end
end

local function load()
  return function()
    local wasStartedWithoutArgs = vim.fn.argc() == 0
    if is_valid_session_env() and wasStartedWithoutArgs then
      local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      local sessionName = opt.session_dir .. cwd .. opt.session_suffix
      local sessionExists = vim.fn.filereadable(vim.fn.expand(sessionName)) == 1
      if sessionExists then
        vim.api.nvim_command("source " .. sessionName)
      end
    end
  end
end

return { load = load(), save = save() }
