local set_hl_for_floating_window = function()
	vim.api.nvim_set_hl(0, "NormalFloat", {
		link = "Normal",
	})
	vim.api.nvim_set_hl(0, "FloatBorder", {
		bg = "none",
	})
	vim.api.nvim_set_hl(0, "SignColumn", {
		bg = "none",
	})
	vim.api.nvim_set_hl(0, "DiffAdd", {
		bg = "none",
	})
	vim.api.nvim_set_hl(0, "DiffText", {
		bg = "none",
	})
	vim.api.nvim_set_hl(0, "DiffChange", {
		bg = "none",
	})
	vim.api.nvim_set_hl(0, "DiffDelete", {
		bg = "none",
	})
end

set_hl_for_floating_window()

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	desc = "Avoid overwritten by loading color schemes later",
	callback = set_hl_for_floating_window,
})

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autoread = true
vim.opt.number = true
vim.opt.laststatus = 2
-- tabs and indents
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.mouse = "a"
vim.opt.fillchars = { eob = " " }
-- Keymaps
local keymap = vim.keymap
keymap.set("n", "x", '"_x') -- no yank with X
keymap.set("n", "<C-a>", "gg<S-v>G") -- select all
require("core.statusline")
require("core.lazy")
require("core.lsp_config")
