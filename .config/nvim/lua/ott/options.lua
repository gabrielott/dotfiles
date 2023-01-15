local opt = vim.opt

opt.fileencodings = {"ucs-bom", "utf-8", "default", "sjis"}
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.scrolloff = 3
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
opt.foldmethod = "indent"
opt.foldnestmax = 2
opt.conceallevel = 2
opt.termguicolors = true
opt.completeopt = "menu,menuone,noselect"

vim.cmd "colorscheme xcodedarkhc"
