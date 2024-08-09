return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-python",
    "haydenmeade/neotest-jest",
    "rouge8/neotest-rust",
  },
  opts = {
    adapters = {
      "neotest-plenary",
      "neotest-go",
      "neotest-python",
      "neotest-jest",
      "neotest-rust",
    },
  },

  keys = require("keys").test,
}
