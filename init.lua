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
require("core.keymaps")
require("core.statusline")
require("core.lazy")
require("core.lsp_config")
require("core.completions_config")
require("core.formatter_config")
