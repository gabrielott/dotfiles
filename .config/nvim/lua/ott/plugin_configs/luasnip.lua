local luasnip = require("luasnip")

local config = {
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
}

luasnip.config.set_config(config)

local loader = require("luasnip.loaders.from_lua")

loader.lazy_load({paths = "~/.config/nvim/snippets"})
