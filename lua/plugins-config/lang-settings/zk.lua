local util = require 'lspconfig.util'

return {
  settings = {
    zk = {
      root_dir = function()
        return util.root_pattern(".gitignore") or vim.loop.cwd()
      end;
    }
  }
}