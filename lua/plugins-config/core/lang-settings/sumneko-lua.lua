return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      format = {
        defaultConfig = {
          quote_style = "double",
        },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}
