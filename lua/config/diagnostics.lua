local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn",  text = "" },
	{ name = "DiagnosticSignHint",  text = "" },
	{ name = "DiagnosticSignInfo",  text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = "", numhl = sign.name })
end

vim.diagnostic.config({
	virtual_text = {
		severity = { min = vim.diagnostic.severity.ERROR },
		spacing = 12,
		prefix = " ",
	},
	signs = {
		active = signs,
	},
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.api.nvim_set_hl(
	0,
	"LspDiagnosticsVirtualTextError",
	{ sp = "Green", ctermfg = "Blue", ctermbg = "Yellow", fg = "Blue", bold = true }
)
