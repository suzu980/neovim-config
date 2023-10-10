return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local status, gitsigns = pcall(require, 'gitsigns')
		if (not status) then return end
		gitsigns.setup{
			signs = {
				add	=	{ text = '+'},
			},
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 100
			}
		}
	end
}
