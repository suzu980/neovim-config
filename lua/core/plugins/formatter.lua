return {
	"mhartington/formatter.nvim",
	config = function()
		local util = require("formatter.util")
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettier,
				},
				typescriptreact = {
					require("formatter.filetypes.typescriptreact").prettier,
				},
				svelte = {
					require("formatter.filetypes.svelte").prettier,
				},
				html = {
					require("formatter.filetypes.html").prettier,
				},
				css = {
					require("formatter.filetypes.css").prettier,
				},
				javascript = {
					require("formatter.filetypes.javascript").prettier,
				},
				javascriptreact = {
					require("formatter.filetypes.javascriptreact").prettier,
				},
				json = {
					require("formatter.filetypes.json").prettier,
				},
				rust = {
					require("formatter.filetypes.rust").rustfmt,
				},
				python = {
					require("formatter.filetypes.python").black,
				},
			},
		})

		vim.keymap.set("n", "<c-a>", ":Format<CR>")
	end,
}
