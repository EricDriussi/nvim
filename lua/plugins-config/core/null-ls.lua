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
    formatting.eslint.with({
      timeout = 10000,
    }),

    --diagnostics.eslint,
    diagnostics.yamllint,

    -- CSS
    diagnostics.stylelint,
    formatting.stylelint,

    -- LSP for shell sucks a bit
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
