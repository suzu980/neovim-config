-- Editor Keymaps
local keymap = vim.keymap
-- Basic Keymaps
keymap.set("n", "x", '"_x') -- no yank with X
keymap.set("n", "<C-a>", "gg<S-v>G") -- select all
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true }) -- V Split
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true }) -- Split

-- Goyo
keymap.set("n", "<leader>go", ":Goyo<CR>")
-- Markdown Enable Conceal
keymap.set("n", "<leader>ce", ":set cole=3<CR>")
-- Markdown Disable Conceal
keymap.set("n", "<leader>cd", ":set cole=0<CR>")
-- Toggle Limelight
keymap.set("n", "<leader>ll", ":Limelight!! 0.8<CR>")

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { silent = true })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { silent = true })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { silent = true })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { silent = true })

-- Nvim-Tree
vim.keymap.set("n", "<c-n>", ":NvimTreeFindFileToggle<CR>", { silent = true })

-- Barbar
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "tb", "<Cmd>BufferPrevious<CR>", opts)
map("n", "tt", "<Cmd>BufferNext<CR>", opts)
map("n", "tq", "<Cmd>BufferClose<CR>", opts)

local light_mode_header = {
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⠟⣿⣿⣿⣿⣿⣱⣹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣯⣿⣿⣿⣿⣿⣃⣤⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡷⢶⣾⢿⣿⣿⣿⡏⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣇⣿⣿⣿⣿⣿⠍⢿⠯⢿⠏⠻⣿⣿⣿⡿⠋⠃⠘⠫⠍⠃⢹⣿⣿⣿⣱⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⢫⠉⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠿⠟⠛⡋⢿⣿⡇⢻⣿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⡠⠊⠀⡀⠀⠀⠁⠀⠘⣿⡇⠈⣿⣿⠁⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠢⠄⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠄⠀⠀⠈⠀⠀⠀⠀⠀⠀⠸⡿⠀⠸⣧⠀⢀⣾⣏⠻⢿⣿⣿⣿⣿⣿⣿⠁⠀⠹⣿⣿⣿⣿⣿⣎⠀⠀⠀⠁⡀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⠆⠀⢹⣠⡞⠹⣿⡀⠘⢸⡿⣯⢉⣿⠇⠀⠀⠀⠘⣿⣿⣿⣿⣿⡀⠀⢀⣩⣴⣶⣤⡀⠀]],
	[[⠀⠀⣠⣴⣶⣶⣶⣦⣤⣀⠀⢂⠀⢠⡆⠀⠀⠉⠀⠈⠟⠀⡀⠹⣧⣤⡿⠁⠸⡞⠍⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣧⣶⣿⣿⣿⣿⣿⣿⠀]],
	[[⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⢂⢸⣷⡀⠀⠀⠀⠀⠀⠀⠐⣄⢿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆]],
	[[⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⢺⣿⠇⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⡶⠊⠀⠀⠀⠀⠀⠀⠀⠀⠸⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇]],
	[[⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡆⠀⠀⠀⠠⠤⠤⠤⠤⣴⣦⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
}
local dark_mode_header = {
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⣠⠀⠀⠀⠀⠀⠎⠆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠐⠀⠀⠀⠀⠀⠼⠛⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢈⡉⠁⡀⠀⠀⠀⢰⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⠀⠀⠀⠀⠀⣲⡀⣐⡀⣰⣄⠀⠀⠀⢀⣴⣼⣧⣔⣲⣼⡆⠀⠀⠀⠎⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡔⣶⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣿⣿⣿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣠⣤⢴⡀⠀⢸⡄⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⢟⣵⣿⢿⣿⣿⣾⣿⣧⠀⢸⣷⠀⠀⣾⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣝⣻⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣻⣿⣿⣷⣿⣿⣿⣿⣿⣿⣇⢀⣿⣇⠘⣿⡿⠁⠰⣄⡀⠀⠀⠀⠀⠀⠀⣾⣿⣆⠀⠀⠀⠀⠀⠱⣿⣿⣿⣾⢿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⣹⣿⡆⠟⢡⣆⠀⢿⣧⡇⢀⠐⡶⠀⣸⣿⣿⣿⣧⠀⠀⠀⠀⠀⢿⣿⡿⠖⠋⠉⠛⢿⣿]],
	[[⣿⣿⠟⠋⠉⠉⠉⠙⠛⠿⣿⡽⣿⡟⢹⣿⣿⣶⣿⣷⣠⣿⢿⣆⠘⠛⢀⣾⣇⢡⣲⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠘⠉⠀⠀⠀⠀⠀⠀⣿]],
	[[⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⡽⡇⠈⢿⣿⣿⣿⣿⣿⣿⣯⠻⡀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹]],
	[[⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⡅⠀⣸⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⢉⣵⣿⣿⣿⣿⣿⣿⣿⣿⣇⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸]],
	[[⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⢹⣿⣿⣿⣟⣛⣛⣛⣛⠋⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
}

local setDarkDashboard = function()
	local dashboard = require("alpha.themes.dashboard")
	dashboard.section.header.val = dark_mode_header
	vim.cmd("AlphaRedraw")
	vim.cmd("colorscheme catppuccin-mocha")
end
local setLightDashboard = function()
	local dashboard = require("alpha.themes.dashboard")
	dashboard.section.header.val = light_mode_header
	vim.cmd("AlphaRedraw")
	vim.cmd("colorscheme catppuccin-latte")
end
vim.keymap.set("n", "<leader>mn", setDarkDashboard, {})
vim.keymap.set("n", "<leader>ml", setLightDashboard, {})
