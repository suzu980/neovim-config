return {
	"preservim/vim-markdown",
	dependencies = { "godlygeek/tabular" },
	config = function()
		vim.opt.foldenable = false
	end,
}
