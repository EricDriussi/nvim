require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    },
    keymaps = {
      uninstall_package = "d",
    },
    max_concurrent_installers = 4,
  }
})

require("mason-lspconfig").setup {
  automatic_installation = true,
}

require("mason-tool-installer").setup {
  ensure_installed = {
    "css-lsp",
    "emmet-ls",
    "html-lsp",
    "typescript-language-server",
    "eslint_d",

    "yaml-language-server",
    "yamllint",

    "bash-language-server",
    "shellcheck",
    "shfmt",

    "ltex-ls",
    "markdownlint",
    "marksman",

    "json-lsp",
    "lua-language-server",
    "python-lsp-server",
    "autopep8",
  },
}
