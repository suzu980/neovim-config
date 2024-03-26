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
local isDark = require("core.light-dark-config")
if isDark and vim.g.neovide then
	vim.cmd("colorscheme catppuccin-mocha")
elseif vim.g.neovide then
	vim.cmd("colorscheme catppuccin-latte")
end
