local cmp = require("cmp")
local luasnip = require("luasnip")

local setup = {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<C-n>"] = cmp.mapping.select_prev_item(),
		["<C-p>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
	},
	sources = cmp.config.sources({
		{name = "luasnip"},
		{name = "nvim_lsp"},
		{name = "buffer"},
		{name = "path"},
	})
}

cmp.setup(setup)
