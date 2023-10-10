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
							"--unrestricted",
							"--line-number",
							"--smart-case"
					}
					end
				},
			}
		}
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	end,
}
