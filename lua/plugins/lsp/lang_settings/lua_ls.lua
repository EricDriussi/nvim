return {
	Lua = {
		runtime = {
			version = "LuaJIT",
		},
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
				vim.fn.expand("$VIMRUNTIME/lua"),
				vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
				"${3rd}/luv/library",
				unpack(vim.api.nvim_get_runtime_file("", true)),
			},
			checkThirdParty = false,
		},
		completion = {
			callSnippet = "Replace",
		},
		telemetry = { enable = false },
	},
}
