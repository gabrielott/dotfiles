local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local keymaps = require("ott.keymaps")

local diagnostics_config = {
	virtual_text = false,
	underline = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(diagnostics_config)

local settings_by_server = {
	sumneko_lua = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	},
	pylsp = {
		pylsp = {
			plugins = {
				pyflakes = { enabled = true },
				pycodestyle = { enabled = false },
			}
		}
	}
}

mason.setup()
mason_lspconfig.setup()

mason_lspconfig.setup_handlers({
	function(server)
		lspconfig[server].setup {
			on_attach = function(client, bufnr)
				keymaps.setup_lsp_keymaps()
			end,
			settings = settings_by_server[server],
			single_file_support = true,
		}
	end
})
