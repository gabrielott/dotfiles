return require('packer').startup(function(use)
	-- Plugin manager
	use "wbthomason/packer.nvim"

	-- Mappings to surround stuff
	use "tpope/vim-surround"

	-- Mappings to comment stuff
	use "tpope/vim-commentary"

	-- Makes tpope plugins work with '.'
	use "tpope/vim-repeat"

	-- Automatically close delimiters
	use "jiangmiao/auto-pairs"

	-- Xcode colors
	use "arzg/vim-colors-xcode"

	-- My personal wiki in vim
	use "vimwiki/vimwiki"

	-- Mappings and auto-compiling for LaTeX
	use {
		"lervag/vimtex",
		opt = true,
		ft = "tex",
	}

	-- Snippets
	use "L3MON4D3/LuaSnip"

	-- Completion
	use "hrsh7th/nvim-cmp"
	use "saadparwaiz1/cmp_luasnip"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-nvim-lsp"

	-- LSP
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	use {
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" }
	}
end)
