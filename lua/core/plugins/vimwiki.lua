return {
	"vimwiki/vimwiki",
	event = "BufEnter *md",
	keys = { "<leader>ww", "<leader>wt" },
	init = function()

		vim.g.vimwiki_ext2syntax = {
			[".md"] = "markdown",
			[".markdown"] = "markdown",
			[".mdown"] = "markdown",
		}

		vim.g.vimwiki_list = {
			{
				path = "~/wiki/Home",
				syntax = "markdown",
				ext = ".md",
			},
			{
				path = "~/wiki/Personal",
				syntax = "markdown",
				ext = ".md",
			},
			{
				path = "~/wiki/Work",
				syntax = "markdown",
				ext = ".md",
			},
		}
	end,
}
