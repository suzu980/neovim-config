require("catppuccin").setup({
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		alpha = true,
		mason = true,
	},
	custom_highlights = function(colors)
		return {
			Pmenu = { bg = colors.none },
		}
	end,
})
vim.cmd("colorscheme catppuccin-mocha")
