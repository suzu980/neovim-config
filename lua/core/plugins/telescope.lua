return {
	'nvim-telescope/telescope.nvim', tag = '0.1.3',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local telescope = require('telescope')
		telescope.setup {
			pickers = {
				find_files = {
					hidden = true,
					no_ignore = true
				},
				live_grep = {
					additional_args = function(opts)
						return{
							"--hidden",
							"--line-number",
							"--smart-case"
					}
					end
				},
			}
		}
	end,
}
