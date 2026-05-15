vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd.syntax("reset")
end

vim.g.colors_name = "cursor_dark"

local p = {
	bg = "#181818",
	bg_dark = "#141414",
	bg_highlight = "#262626",
	bg_selection = "#404040",
	fg = "#E4E4E4",
	fg_muted = "#A4A4A4",
	fg_dim = "#737373",
	border = "#3A3A3A",

	blue = "#87C3FF",
	blue2 = "#81A1C1",
	cyan = "#82D2CE",
	cyan2 = "#88C0D0",
	green = "#A8CC7C",
	green2 = "#70B489",
	yellow = "#F8C762",
	orange = "#EFB080",
	red = "#E34671",
	red2 = "#FC6B83",
	purple = "#AAA0FA",
	magenta = "#E394DC",
}

local function hl(group, spec)
	vim.api.nvim_set_hl(0, group, spec)
end

-- Editor
hl("Normal", { fg = p.fg, bg = p.bg })
hl("NormalNC", { fg = p.fg, bg = p.bg })
hl("NormalFloat", { fg = p.fg, bg = p.bg_dark })
hl("FloatBorder", { fg = p.border, bg = p.bg_dark })
hl("FloatTitle", { fg = p.fg, bg = p.bg_dark, bold = true })
hl("Cursor", { fg = p.bg, bg = p.fg })
hl("CursorLine", { bg = p.bg_highlight })
hl("CursorColumn", { bg = p.bg_highlight })
hl("LineNr", { fg = p.fg_dim })
hl("CursorLineNr", { fg = p.fg, bold = true })
hl("SignColumn", { bg = p.bg })
hl("ColorColumn", { bg = p.bg_dark })
hl("Visual", { bg = p.bg_selection })
hl("Search", { fg = p.bg, bg = p.cyan2 })
hl("IncSearch", { fg = p.bg, bg = p.yellow })
hl("CurSearch", { fg = p.bg, bg = p.yellow })
hl("MatchParen", { fg = p.fg, bg = "#333333", bold = true })
hl("NonText", { fg = p.fg_dim })
hl("Whitespace", { fg = "#505050" })
hl("EndOfBuffer", { fg = p.bg })
hl("Folded", { fg = p.fg_dim, bg = p.bg_dark })
hl("FoldColumn", { fg = p.fg_dim, bg = p.bg })

-- Menus
hl("Pmenu", { fg = p.fg, bg = p.bg_dark })
hl("PmenuSel", { fg = p.fg, bg = "#343434" })
hl("PmenuSbar", { bg = p.bg_highlight })
hl("PmenuThumb", { bg = p.fg_dim })
hl("WildMenu", { fg = p.fg, bg = p.bg_highlight })

-- Splits/status/tabline
hl("WinSeparator", { fg = p.border })
hl("StatusLine", { fg = p.fg_dim, bg = p.bg_dark })
hl("StatusLineNC", { fg = p.fg_dim, bg = p.bg_dark })
hl("TabLine", { fg = p.fg_dim, bg = p.bg_dark })
hl("TabLineSel", { fg = p.fg, bg = p.bg })
hl("TabLineFill", { bg = p.bg_dark })

-- Base syntax
hl("Comment", { fg = p.fg_dim, italic = true })
hl("Constant", { fg = p.yellow })
hl("String", { fg = p.magenta })
hl("Character", { fg = p.magenta })
hl("Number", { fg = p.yellow })
hl("Boolean", { fg = p.cyan })
hl("Float", { fg = p.yellow })
hl("Identifier", { fg = p.fg })
hl("Function", { fg = p.orange })
hl("Statement", { fg = p.cyan })
hl("Conditional", { fg = p.cyan, italic = true })
hl("Repeat", { fg = p.cyan, italic = true })
hl("Label", { fg = p.purple })
hl("Operator", { fg = p.fg })
hl("Keyword", { fg = p.cyan })
hl("Exception", { fg = p.red })
hl("PreProc", { fg = p.green })
hl("Include", { fg = p.green, italic = true })
hl("Define", { fg = p.green })
hl("Macro", { fg = p.green })
hl("Type", { fg = p.blue })
hl("StorageClass", { fg = p.cyan })
hl("Structure", { fg = p.blue })
hl("Typedef", { fg = p.blue })
hl("Special", { fg = p.purple })
hl("SpecialChar", { fg = p.cyan })
hl("Tag", { fg = p.blue })
hl("Delimiter", { fg = p.fg_muted })
hl("SpecialComment", { fg = p.fg_dim, italic = true })
hl("Debug", { fg = p.red })
hl("Underlined", { fg = p.blue2, underline = true })
hl("Error", { fg = p.red })
hl("Todo", { fg = p.yellow, bold = true })

-- Treesitter
hl("@variable", { fg = p.fg })
hl("@variable.builtin", { fg = p.cyan })
hl("@variable.parameter", { fg = p.yellow })
hl("@variable.member", { fg = p.purple })
hl("@constant", { fg = p.yellow })
hl("@constant.builtin", { fg = p.cyan })
hl("@module", { fg = p.orange })
hl("@label", { fg = p.purple })
hl("@string", { fg = p.magenta })
hl("@string.escape", { fg = p.cyan })
hl("@character", { fg = p.magenta })
hl("@number", { fg = p.yellow })
hl("@boolean", { fg = p.cyan })
hl("@type", { fg = p.blue })
hl("@type.builtin", { fg = p.cyan })
hl("@attribute", { fg = p.purple })
hl("@property", { fg = p.purple })
hl("@function", { fg = p.orange })
hl("@function.builtin", { fg = p.cyan })
hl("@function.call", { fg = p.yellow })
hl("@function.method", { fg = p.orange })
hl("@function.method.call", { fg = p.yellow })
hl("@constructor", { fg = p.orange })
hl("@keyword", { fg = p.cyan })
hl("@keyword.function", { fg = p.cyan })
hl("@keyword.import", { fg = p.green, italic = true })
hl("@keyword.conditional", { fg = p.cyan, italic = true })
hl("@keyword.repeat", { fg = p.cyan, italic = true })
hl("@keyword.operator", { fg = p.cyan })
hl("@operator", { fg = p.fg })
hl("@punctuation.delimiter", { fg = p.fg_muted })
hl("@punctuation.bracket", { fg = p.fg_muted })
hl("@punctuation.special", { fg = p.cyan })
hl("@comment", { fg = p.fg_dim, italic = true })
hl("@comment.todo", { fg = p.yellow, bold = true })
hl("@comment.error", { fg = p.red, bold = true })
hl("@comment.warning", { fg = p.yellow, bold = true })
hl("@comment.note", { fg = p.cyan2, bold = true })
hl("@markup.heading", { fg = p.purple, bold = true })
hl("@markup.link", { fg = p.cyan2, underline = true })
hl("@markup.raw", { fg = p.magenta })

-- Diagnostics / LSP
hl("DiagnosticError", { fg = p.red })
hl("DiagnosticWarn", { fg = p.yellow })
hl("DiagnosticInfo", { fg = p.cyan2 })
hl("DiagnosticHint", { fg = p.green })
hl("DiagnosticOk", { fg = p.green2 })
hl("DiagnosticUnderlineError", { undercurl = true, sp = p.red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = p.yellow })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = p.cyan2 })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = p.green })
hl("DiagnosticVirtualTextError", { fg = p.red, bg = "#2A1820" })
hl("DiagnosticVirtualTextWarn", { fg = p.yellow, bg = "#2A2318" })
hl("DiagnosticVirtualTextInfo", { fg = p.cyan2, bg = "#182429" })
hl("DiagnosticVirtualTextHint", { fg = p.green, bg = "#1D261B" })
hl("DiagnosticUnnecessary", { fg = p.fg_dim })
hl("LspInlayHint", { fg = p.fg_dim, bg = "NONE" })
hl("LspReferenceText", { bg = "#2A2A2A" })
hl("LspReferenceRead", { bg = "#2A2A2A" })
hl("LspReferenceWrite", { bg = "#333333" })

-- Git
hl("GitSignsAdd", { fg = p.green2 })
hl("GitSignsChange", { fg = p.yellow })
hl("GitSignsDelete", { fg = p.red })
hl("DiffAdd", { bg = "#1F3325" })
hl("DiffChange", { bg = "#332A1E" })
hl("DiffDelete", { bg = "#351B25" })
hl("DiffText", { bg = "#4A3820" })

-- Snacks
hl("SnacksPicker", { fg = p.fg, bg = p.bg_dark })
hl("SnacksPickerBorder", { fg = p.border, bg = p.bg_dark })
hl("SnacksPickerTitle", { fg = p.fg, bg = p.bg_dark, bold = true })
hl("SnacksPickerInput", { fg = p.fg, bg = p.bg_dark })
hl("SnacksPickerMatch", { fg = p.cyan2, bold = true })
hl("SnacksPickerDir", { fg = p.fg_dim })
hl("SnacksPickerFile", { fg = p.fg, bold = true })
hl("SnacksIndent", { fg = "#2F2F2F" })
hl("SnacksIndentScope", { fg = p.fg_dim })
hl("SnacksNotifierBorderError", { fg = p.red })
hl("SnacksNotifierBorderWarn", { fg = p.yellow })
hl("SnacksNotifierBorderInfo", { fg = p.cyan2 })
hl("SnacksNotifierBorderDebug", { fg = p.fg_dim })
hl("SnacksNotifierBorderTrace", { fg = p.purple })

-- Completion / blink
hl("BlinkCmpMenu", { fg = p.fg, bg = p.bg_dark })
hl("BlinkCmpMenuBorder", { fg = p.border, bg = p.bg_dark })
hl("BlinkCmpMenuSelection", { fg = p.fg, bg = "#343434" })
hl("BlinkCmpLabelMatch", { fg = p.cyan2, bold = true })
hl("BlinkCmpDoc", { fg = p.fg, bg = p.bg_dark })
hl("BlinkCmpDocBorder", { fg = p.border, bg = p.bg_dark })
hl("BlinkCmpSignatureHelp", { fg = p.fg, bg = p.bg_dark })
hl("BlinkCmpSignatureHelpBorder", { fg = p.border, bg = p.bg_dark })

-- Which-key / todo-comments
hl("WhichKey", { fg = p.cyan2 })
hl("WhichKeyGroup", { fg = p.purple })
hl("WhichKeyDesc", { fg = p.fg })
hl("TodoBgTODO", { fg = p.bg, bg = p.yellow, bold = true })
hl("TodoBgFIX", { fg = p.bg, bg = p.red, bold = true })
hl("TodoBgNOTE", { fg = p.bg, bg = p.cyan2, bold = true })

-- Terminal colors
vim.g.terminal_color_0 = "#242424"
vim.g.terminal_color_1 = p.red2
vim.g.terminal_color_2 = p.green2
vim.g.terminal_color_3 = p.yellow
vim.g.terminal_color_4 = p.blue2
vim.g.terminal_color_5 = "#B48EAD"
vim.g.terminal_color_6 = p.cyan2
vim.g.terminal_color_7 = p.fg
vim.g.terminal_color_8 = p.fg_dim
vim.g.terminal_color_9 = p.red2
vim.g.terminal_color_10 = p.green2
vim.g.terminal_color_11 = p.yellow
vim.g.terminal_color_12 = "#87A6C4"
vim.g.terminal_color_13 = "#B48EAD"
vim.g.terminal_color_14 = p.cyan2
vim.g.terminal_color_15 = p.fg
