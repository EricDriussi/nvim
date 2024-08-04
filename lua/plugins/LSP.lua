return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "rN", LazyVim.lsp.rename_file }
      keys[#keys + 1] = { "rn", vim.lsp.buf.rename }
      keys[#keys + 1] = { "<c-k>", vim.lsp.buf.signature_help }
      keys[#keys + 1] = { "<M-cr>", LazyVim.lsp.action.source }
      opts.inlay_hints = { enabled = false }
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        keymaps = {
          uninstall_package = "d",
        },
        max_concurrent_installers = 6,
      },
      ensure_installed = {
        "actionlint",
        "bash-language-server",
        "beautysh",
        "css-lsp",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "emmet-ls",
        "eslint-lsp",
        "eslint_d",
        "gofumpt",
        "gopls",
        "html-lsp",
        "json-lsp",
        "ltex-ls",
        "lua-language-server",
        "markdownlint",
        "marksman",
        "mypy",
        "python-lsp-server",
        "prettierd",
        "rust-analyzer",
        "shellcheck",
        "shfmt",
        "stylua",
        "typescript-language-server",
        "yaml-language-server",
        "yamlfmt",
        "yamllint",
      },
    },
  },
}
