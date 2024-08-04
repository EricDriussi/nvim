return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      markdown = { "markdownlint" },
      yml = { "ansible_lint" },
      yaml = { "ansible_lint" },
      zsh = { "zsh" },
    },
  },
}
