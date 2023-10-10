return {
	"mfussenegger/nvim-lint",
	config = function()
		require('lint').linters_by_ft = {
			javascript = {"eslint_d"},
			typescript = {"eslint_d"},
			javascriptreact = {"eslint_d"},
			typescriptreact = {"eslint_d"},
			svelte = {"eslint_d"},
		}
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
		vim.keymap.set('n', '<leader>l', function()
			require("lint").try_lint()
		end, {desc = 'Lint triggered for current file'})
	end,
}
