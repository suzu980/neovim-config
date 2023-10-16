local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
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
dashboard.section.header.val = light_mode_header

dashboard.section.buttons.val = {
	dashboard.button("e", "🗎   New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "🗁   Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("f", "🔍  Find file", ":Telescope find_files <CR>"),
	dashboard.button("t", "🗛   Find text", ":Telescope live_grep <CR>"),
	dashboard.button("q", "⍇   Quit", ":qa<CR>"),
}

local function footer()
	return "     	  ~ Always learning ~\nVersion 1.1 of Neovim Configuration\nAuthor : https://github.com/suzu980"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Include"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
