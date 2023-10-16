-- Get the colors for a specific theme
--local colors = require("kanagawa.colors").setup({})
--local dragon_theme_colors = colors.theme
---- Set Colors for modes
--vim.api.nvim_set_hl(
--	0,
--	"StatusLineAccent",
--	{ fg = dragon_theme_colors.ui.fg, bg = dragon_theme_colors.ui.bg_p1, bold = true }
--)
--vim.api.nvim_set_hl(
--	0,
--	"StatusLineInsertAccent",
--	{ fg = dragon_theme_colors.diag.warning, bg = dragon_theme_colors.ui.bg_p1, bold = true }
--)
--vim.api.nvim_set_hl(
--	0,
--	"StatusLineVisualAccent",
--	{ fg = dragon_theme_colors.diag.warning, bg = dragon_theme_colors.ui.bg_p1, bold = true }
--)
--vim.api.nvim_set_hl(
--	0,
--	"StatusLineReplaceAccent",
--	{ fg = dragon_theme_colors.diag.warning, bg = dragon_theme_colors.ui.bg_p1, bold = true }
--)
--vim.api.nvim_set_hl(
--	0,
--	"StatusLineCmdLineAccent",
--	{ fg = dragon_theme_colors.diag.warning, bg = dragon_theme_colors.ui.bg_p1, bold = true }
--)
--vim.api.nvim_set_hl(
--	0,
--	"StatusLineTerminalAccent",
--	{ fg = dragon_theme_colors.diag.warning, bg = dragon_theme_colors.ui.bg_p1, bold = true }
--)
--vim.api.nvim_set_hl(
--	0,
--	"StatusLineExtra",
--	{ fg = dragon_theme_colors.ui.fg, bg = dragon_theme_colors.ui.bg_m2, bold = true }
--)
---- LSP Diagnostics
--vim.api.nvim_set_hl(
--	0,
--	"LspDiagnosticsSignError",
--	{ fg = dragon_theme_colors.diag.error, bg = dragon_theme_colors.ui.bg, bold = true }
--)
--vim.api.nvim_set_hl(
--	0,
--	"LspDiagnosticsSignWarning",
--	{ fg = dragon_theme_colors.diag.warning, bg = dragon_theme_colors.ui.bg, bold = true }
--)
--vim.api.nvim_set_hl(
--	0,
--	"LspDiagnosticsSignInformation",
--	{ fg = dragon_theme_colors.diag.info, bg = dragon_theme_colors.ui.bg, bold = true }
--)
--vim.api.nvim_set_hl(
--	0,
--	"LspDiagnosticsSignHint",
--	{ fg = dragon_theme_colors.diag.hint, bg = dragon_theme_colors.ui.bg, bold = true }
--)

local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "VISUAL LINE",
	[""] = "VISUAL BLOCK",
	["s"] = "SELECT",
	["S"] = "SELECT LINE",
	[""] = "SELECT BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "VISUAL REPLACE",
	["c"] = "COMMAND",
	["cv"] = "VIM EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MOAR",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}
local function mode()
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format(" %s ", modes[current_mode]):upper()
end

local function update_mode_colors()
	local current_mode = vim.api.nvim_get_mode().mode
	local mode_color = "%#StatusLineAccent#"
	if current_mode == "n" then
		mode_color = "%#StatusLineAccent#"
	elseif current_mode == "i" or current_mode == "ic" then
		mode_color = "%#StatusLineInsertAccent#"
	elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
		mode_color = "%#StatusLineVisualAccent#"
	elseif current_mode == "R" then
		mode_color = "%#StatusLineReplaceAccent#"
	elseif current_mode == "c" then
		mode_color = "%#StatusLineCmdLineAccent#"
	elseif current_mode == "t" then
		mode_color = "%#StatusLineTerminalAccent#"
	end
	return mode_color
end

local function filepath()
	local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
	if fpath == "" or fpath == "." then
		return " "
	end

	return string.format(" %%<%s/", fpath)
end

local function filename()
	local fname = vim.fn.expand("%:t")
	if fname == "" then
		return ""
	end
	if fname == "NvimTree_1" then
		return ""
	end
	return fname .. " "
end
local function lsp()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		errors = "%#LspDiagnosticsSignError# [x]" .. count["errors"]
	end
	if count["warnings"] ~= 0 then
		warnings = "%#LspDiagnosticsSignWarning# [!]" .. count["warnings"]
	end
	if count["hints"] ~= 0 then
		hints = "%#LspDiagnosticsSignHint# [?]" .. count["hints"]
	end
	if count["info"] ~= 0 then
		info = "%#LspDiagnosticsSignInformation# [??]" .. count["info"]
	end

	return errors .. warnings .. hints .. info .. " "
end

local function filetype()
	return string.format(" %s ", vim.bo.filetype):upper()
end

local function lineinfo()
	if vim.bo.filetype == "alpha" then
		return ""
	end
	return " %P %l:%c "
end

local vcs = function()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end
	local added = git_info.added and ("%#GitSignsAdd# +" .. git_info.added) or ""
	local changed = git_info.changed and ("%#GitSignsChange# ~" .. git_info.changed) or ""
	local removed = git_info.removed and ("%#GitSignsDelete# -" .. git_info.removed) or ""
	if git_info.added == 0 then
		added = ""
	end
	if git_info.changed == 0 then
		changed = ""
	end
	if git_info.removed == 0 then
		removed = ""
	end
	return table.concat({
		" ",
		added,
		changed,
		removed,
		" ",
		"%#GitSignsAdd#  ",
		git_info.head,
		" %#Normal#",
	})
end

Statusline = {}

Statusline.active = function()
	return table.concat({
		"%#Statusline#",
		update_mode_colors(),
		mode(),
		"%#Normal#",
		filepath(),
		filename(),
		"%#Normal#",
		vcs(),
		"%#Normal#",
		lsp(),
		"%#Normal#",
		"%=%#StatusLineExtra#",
		filetype(),
		lineinfo(),
	})
end

function Statusline.inactive()
	return " %F"
end

function Statusline.short()
	return "%#StatusLineNC#   NvimTree"
end

vim.api.nvim_exec(
	[[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]],
	false
)
