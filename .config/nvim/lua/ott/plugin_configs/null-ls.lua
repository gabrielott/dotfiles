local null = require("null-ls")
local formatting = null.builtins.formatting
local diagnostics = null.builtins.diagnostics

local config = {
	sources = {
		formatting.stylua.with { extra_args = { "--call-parentheses None" } },
		diagnostics.shellcheck,
		diagnostics.pylint.with { extra_args = {
			"--disable=missing-function-docstring",
			"--disable=missing-module-docstring",
		} }
	}
}

null.setup(config)
