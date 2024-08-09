return {
  { "<leader>t", "", desc = "+test" },
  {
    "<leader>tr",
    function()
      require("neotest").run.run()
      require("neotest").summary.open()
    end,
    desc = "Run Nearest",
  },
  {
    "<leader>tR",
    function()
      require("neotest").run.run(vim.fn.expand("%"))
      require("neotest").summary.open()
    end,
    desc = "Run File",
  },
  {
    "<leader>ta",
    function()
      require("neotest").run.run(vim.uv.cwd())
      require("neotest").summary.open()
    end,
    desc = "Run All Tests",
  },
  {
    "<leader>tt",
    function()
      require("neotest").summary.toggle()
    end,
    desc = "Toggle Output",
  },
  {
    "<leader>ts",
    function()
      require("neotest").run.stop()
    end,
    desc = "Stop",
  },
}
