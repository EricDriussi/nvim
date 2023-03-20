return function()
	local go_adapter = require("neotest-go")
	local lua_adapter = require("neotest-plenary")
	local python_adapter = require("neotest-python")
	local jest_adapter = require("neotest-jest")

	require("neotest").setup({
		diagnostic = { enabled = false },
		quickfix = {
			open = false,
		},
		output = {
			enabled = false,
		},
		adapters = {
			go_adapter({
				experimental = {
					test_table = true,
				},
				args = { "-count=1", "-timeout=60s" },
			}),
			lua_adapter,
			python_adapter,
			jest_adapter,
		},
	})
end
