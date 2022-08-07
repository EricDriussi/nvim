local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions
null_ls.setup({
  debug = false,
  sources = {
    formatting.eslint_d.with({
      timeout = 10000,
    }),

    diagnostics.yamllint,
    diagnostics.markdownlint.with({
      extra_args = { "--disable", "MD029", "MD013", "MD041" }
    }),
    formatting.markdownlint,

    actions.shellcheck,
    diagnostics.shellcheck,
    formatting.shfmt,

    diagnostics.zsh,
    formatting.beautysh.with({
      filetypes = { "zsh" }
    }),

    formatting.autopep8.with({
      extra_args = { "-a" }
    }),
  },
})
