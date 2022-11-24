local status_ok, rooter = pcall(require, "nvim-rooter")
if not status_ok then
  return
end

local opt = {
  ignoredFiletypes = { "man", "gitignore", "gitcommit" },
  sessionDir = "~/.cache/nvim_sessions/",
  sessionSuffix = ".sess.vim"
}

local function isValidfileType()
  local ft = vim.bo.filetype
  for _, ift in pairs(opt.ignoredFiletypes) do
    if ift == ft then
      return false
    end
  end
  return true
end

local function isGitProject()
  return rooter.get_root() ~= nil
end

local function isValidSessionEnv()
  return isGitProject() and isValidfileType()

end

function Save()
  return function()
    if isValidSessionEnv() then
      os.execute("mkdir -p " .. opt.sessionDir)
      local rootPath = rooter.get_root()
      local projectRoot = string.match(rootPath, ".*/(.*)$")
      vim.api.nvim_command("mksession! " .. opt.sessionDir .. projectRoot .. opt.sessionSuffix)
    end
  end
end

function Load()
  return function()
    local wasStartedWithoutArgs = vim.fn.argc() == 0
    if isValidSessionEnv() and wasStartedWithoutArgs then
      local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      local sessionName = opt.sessionDir .. cwd .. opt.sessionSuffix
      local sessionExists = vim.fn.filereadable(vim.fn.expand(sessionName)) == 1
      if sessionExists then
        vim.api.nvim_command("source " .. sessionName)
      end
    end
  end
end

return { load = Load(), save = Save() }
