local wiki = {
	path = "~/wiki/pages",
	path_html = "~/wiki/html",
	template_path = "~/wiki/templates",
	template_ext = ".html",
	template_default = "mydefault",
	auto_export = 1,
	auto_toc = 1,
	auto_tags = 1,
	links_space_char = "_",
}

vim.g.vimwiki_list = {wiki}
vim.g.vimwiki_folding = "expr"
vim.g.vimwiki_valid_html_tags = "b,i,s,u,sub,sup,kbd,br,hr,details,summary"
