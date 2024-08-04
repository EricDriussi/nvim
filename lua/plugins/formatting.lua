return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt", "shellharden" },
        zsh = { "shfmt", "shellharden" },

        yaml = { "yamlfmt" },

        astro = { { "prettierd", "prettier" } },

        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
      },

      formatters = {
        yamlfmt = {
          prepend_args = { "-formatter", "retain_line_breaks=true,scan_folded_as_literal=true" },
        },
      },
    },
  },
}
