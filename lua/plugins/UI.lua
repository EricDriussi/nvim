local function readingTime()
  if vim.bo.filetype ~= "markdown" then
    return ""
  end

  local wordsInBuff = vim.fn.wordcount().words
  local avgReadingSpeed = 250
  local time = math.ceil(wordsInBuff / avgReadingSpeed)
  return string.format("%s 🕐", time)
end

local function path_from_root()
  local bufname = vim.api.nvim_buf_get_name(0)
  local root = vim.fs.root(0, { ".git" }) or vim.fn.expand("%:p:h")

  local escaped_root = root:gsub("([%(%)%.%%%+%-%*%?%[%^%$%]])", "%%%1")
  local rel_path = string.gsub(bufname, "^" .. escaped_root .. "/", "")

  local pretty_output = string.gsub(rel_path, "/", " > ")
  return pretty_output
end

local function recording_macro()
  return {
    function()
      return require("noice").api.status.mode.get()
    end,
    cond = function()
      return package.loaded["noice"] and require("noice").api.status.mode.has()
    end,
    color = function()
      return LazyVim.ui.fg("Constant")
    end,
  }
end

return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        indicator = {
          style = "none",
        },
        offsets = {
          {
            text = "",
          },
        },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local diagn_icons = LazyVim.config.icons.diagnostics
      return {
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = diagn_icons.Error,
                warn = diagn_icons.Warn,
                info = diagn_icons.Info,
                hint = diagn_icons.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 2, right = 0 } },
            path_from_root,
          },
          lualine_x = {
            recording_macro(),
            { "fileformat", padding = { right = 2 } },
            readingTime,
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },

  {
    "folke/noice.nvim",
    opts = {
      -- no popup for cmdline
      cmdline = {
        view = "cmdline",
      },
      routes = {
        -- hide `written` messages
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
      },
    },
  },
}
