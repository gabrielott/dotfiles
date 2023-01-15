local M = {}

local keymap = vim.api.nvim_set_keymap
local lkeymap = vim.keymap.set

local opts_default = {
	noremap = true,
	silent = true,
}

local opts_expr = {
	noremap = true,
	silent = true,
	expr = true,
}

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Insert blank line
keymap("n", "<Leader>s", "o<Esc>", opts_default)
keymap("n", "<Leader>S", "O<Esc>", opts_default)

-- Paste/Yank to system clipboard
keymap("n", "<Leader>Y", '"+y$', opts_default)
keymap("n", "<Leader>y", '"+y', opts_default)
keymap("n", "<Leader>p", '"+p', opts_default)
keymap("n", "<Leader>P", '"+P', opts_default)
keymap("v", "<Leader>p", '"+p', opts_default)
keymap("v", "<Leader>y", '"+y', opts_default)

-- Paste without changing default register (visual mode)
keymap("v", "<Leader>P", '"_p', opts_default)

-- Paste last yanked
keymap("n", "<Leader><Leader>p", '"0p', opts_default)
keymap("n", "<Leader><Leader>P", '"0P', opts_default)
keymap("v", "<Leader><Leader>p", '"0p', opts_default)

-- Navigate buffers
keymap("n", "<Right>", ":bn<CR>", opts_default)
keymap("n", "<Left>", ":bN<CR>", opts_default)

-- luasnip
keymap("i", "<C-s>", "<Plug>luasnip-expand-or-jump", opts_default)

lkeymap("n", "<Leader>t", vim.diagnostic.open_float, opts_default)
lkeymap("n", "[t", vim.diagnostic.goto_prev, opts_default)
lkeymap("n", "]t", vim.diagnostic.goto_next, opts_default)
lkeymap("n", "<Leader>f", vim.lsp.buf.format, opts_default)

-- LSP, this is called by the on_attach method
function M.setup_lsp_keymaps()
	lkeymap("n", "gD", vim.lsp.buf.declaration, opts_default)
	lkeymap("n", "gd", vim.lsp.buf.definition, opts_default)
	lkeymap("n", "K", vim.lsp.buf.hover, opts_default)
	lkeymap('n', 'gi', vim.lsp.buf.implementation, opts_default)
	lkeymap('n', '<C-k>', vim.lsp.buf.signature_help, opts_default)
end

return M
