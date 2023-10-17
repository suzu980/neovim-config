return {
	"preservim/vim-markdown",
	dependencies = { "godlygeek/tabular" },
	init = function()
		vim.g.vim_markdown_folding_disabled = 1
		--vim.opt.foldenable = false
	end,
}
