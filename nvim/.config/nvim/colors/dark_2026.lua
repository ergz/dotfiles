-- VS Code Dark 2026, adapted to Neovim's syntax, Treesitter, and LSP groups.
-- Palette: https://github.com/microsoft/vscode/blob/main/extensions/theme-defaults/themes/2026-dark.json
-- TextMate scopes and Neovim captures differ, so language-specific coloring is approximate.

vim.o.background = "dark"
vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd.syntax("reset")
end
vim.g.colors_name = "dark_2026"

local p = {
  bg = "#121314",
  panel = "#191A1B",
  float = "#121314", -- Floats share the editor background; borders separate them.
  line = "#242526",
  border = "#636567",
  fg = "#BBBEBF",
  ui = "#BFBFBF",
  muted = "#8C8C8C",
  line_number = "#858889",
  disabled = "#555555",
  accent = "#3994BC",
  link = "#48A0C7",
  comment = "#8B949E",
  variable = "#C9D1D9",
  red = "#FF7B72",
  blue = "#79C0FF",
  orange = "#FFA657",
  purple = "#D2A8FF",
  green = "#7EE787",
  string = "#A5D6FF",
  -- Inherited from Dark+ via dark_modern.json.
  teal = "#4EC9B0",
  pink = "#C586C0",
  keyword_blue = "#569CD6",
  invalid = "#FFA198",
  error = "#F48771",
  warning = "#E5BA7D",
  added = "#72C892",
  deleted = "#F28772",
}

-- Neovim needs opaque RGB: composite VS Code's alpha colors over their surface.
local function blend(hex, background)
  background = background or p.bg
  local alpha = tonumber(hex:sub(8, 9), 16) / 255
  local channels = {}
  for i = 2, 6, 2 do
    local fg = tonumber(hex:sub(i, i + 1), 16)
    local bg = tonumber(background:sub(i, i + 1), 16)
    channels[#channels + 1] = math.floor(fg * alpha + bg * (1 - alpha) + 0.5)
  end
  return string.format("#%02X%02X%02X", unpack(channels))
end

local function hl(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

-- Editor and interface.
hl("Normal", { fg = p.fg, bg = p.bg })
hl("NormalNC", { link = "Normal" })
hl("NormalFloat", { fg = p.ui, bg = p.float })
hl("FloatBorder", { fg = p.border, bg = p.float })
hl("FloatTitle", { fg = p.ui, bg = p.float, bold = true })
hl("Cursor", { fg = p.bg, bg = p.fg })
hl("lCursor", { link = "Cursor" })
hl("TermCursor", { link = "Cursor" })
hl("CursorLine", { bg = p.line })
hl("CursorColumn", { link = "CursorLine" })
hl("LineNr", { fg = p.line_number })
hl("CursorLineNr", { fg = p.fg })
hl("SignColumn", { bg = p.bg })
hl("ColorColumn", { bg = p.line })
hl("Visual", { bg = blend("#276782DD") })
hl("VisualNOS", { bg = blend("#27678260") })
hl("Search", { bg = blend("#27678280") })
hl("CurSearch", { bg = blend("#27678290"), bold = true })
hl("IncSearch", { link = "CurSearch" })
hl("Substitute", { fg = p.bg, bg = p.orange })
hl("MatchParen", { bg = blend("#3994BC55"), bold = true })
hl("NonText", { fg = p.disabled })
hl("Whitespace", { fg = blend("#8C8C8C4D") })
hl("SpecialKey", { link = "Whitespace" })
hl("EndOfBuffer", { fg = p.bg })
hl("Folded", { fg = p.muted, bg = p.panel })
hl("FoldColumn", { fg = p.muted, bg = p.bg })
hl("WinSeparator", { fg = p.border })
hl("StatusLine", { fg = p.muted, bg = p.panel })
hl("StatusLineNC", { fg = p.muted, bg = p.bg })
hl("TabLine", { fg = p.muted, bg = p.panel })
hl("TabLineSel", { fg = p.ui, bg = p.bg })
hl("TabLineFill", { bg = p.panel })
hl("WinBar", { fg = p.ui, bg = p.bg })
hl("WinBarNC", { fg = p.muted, bg = p.bg })
hl("Pmenu", { fg = p.ui, bg = p.float })
hl("PmenuSel", { fg = p.ui, bg = blend("#FFFFFF26", p.float) })
hl("PmenuMatch", { fg = p.ui, bold = true })
hl("PmenuMatchSel", { fg = p.ui, bold = true })
hl("PmenuSbar", { bg = p.line })
hl("PmenuThumb", { bg = p.muted })
hl("WildMenu", { fg = "#FFFFFF", bg = "#297AA0" })
hl("Title", { fg = p.ui, bold = true })
hl("Directory", { fg = p.blue })
hl("ErrorMsg", { fg = p.error })
hl("WarningMsg", { fg = p.warning })
hl("MoreMsg", { fg = p.accent })
hl("Question", { fg = p.accent })
hl("QuickFixLine", { bg = p.line })
hl("Conceal", { fg = p.muted })

-- Traditional syntax highlighting, also used as Treesitter/LSP link targets.
hl("Comment", { fg = p.comment })
hl("Constant", { fg = p.blue })
hl("String", { fg = p.string })
hl("Character", { fg = p.red })
hl("Number", { fg = p.blue })
hl("Boolean", { fg = p.blue })
hl("Float", { link = "Number" })
hl("Identifier", { fg = p.variable })
hl("Function", { fg = p.purple })
hl("Statement", { fg = p.red })
hl("Operator", { fg = p.red })
hl("Keyword", { fg = p.red })
hl("PreProc", { fg = p.red })
hl("Type", { fg = p.orange })
hl("StorageClass", { fg = p.red })
hl("Special", { fg = p.blue })
hl("SpecialChar", { fg = p.red })
hl("Tag", { fg = p.green })
hl("Delimiter", { fg = p.fg })
hl("Underlined", { fg = p.string, underline = true })
hl("Error", { fg = p.invalid, italic = true })
hl("Todo", { fg = p.warning, bold = true })

-- Dark+ layer that 2026 Dark inherits for types, control flow, and word operators.
hl("Structure", { fg = p.teal })
hl("Conditional", { fg = p.pink })
hl("Repeat", { fg = p.pink })
hl("Exception", { fg = p.pink })
hl("Include", { fg = p.pink })

local links = {
  ["@variable"] = "Identifier",
  ["@variable.builtin"] = "Constant",
  ["@variable.member"] = "Identifier",
  ["@constant"] = "Constant",
  ["@constant.builtin"] = "Constant",
  ["@constant.macro"] = "Constant",
  ["@module"] = "Structure",
  ["@module.builtin"] = "Special",
  ["@label"] = "Type",
  ["@string"] = "String",
  ["@string.regexp"] = "String",
  ["@string.escape"] = "SpecialChar",
  ["@string.special"] = "Special",
  ["@string.special.url"] = "Underlined",
  ["@character"] = "Character",
  ["@character.special"] = "SpecialChar",
  ["@number"] = "Number",
  ["@number.float"] = "Number",
  ["@boolean"] = "Boolean",
  ["@type"] = "Structure",
  ["@type.builtin"] = "Structure",
  ["@type.definition"] = "Structure",
  ["@attribute"] = "Type",
  ["@attribute.builtin"] = "Special",
  ["@property"] = "Identifier",
  ["@function"] = "Function",
  ["@function.builtin"] = "Special",
  ["@function.call"] = "Function",
  ["@function.macro"] = "Function",
  ["@function.method"] = "Function",
  ["@function.method.call"] = "Function",
  ["@constructor"] = "Structure",
  ["@operator"] = "Operator",
  ["@keyword"] = "Keyword",
  ["@keyword.conditional"] = "Conditional",
  ["@keyword.conditional.ternary"] = "Conditional",
  ["@keyword.repeat"] = "Repeat",
  ["@keyword.return"] = "Conditional",
  ["@keyword.exception"] = "Exception",
  ["@keyword.import"] = "Include",
  ["@keyword.coroutine"] = "Conditional",
  ["@punctuation.delimiter"] = "Delimiter",
  ["@punctuation.bracket"] = "Delimiter",
  ["@punctuation.special"] = "SpecialChar",
  ["@comment"] = "Comment",
  ["@comment.todo"] = "Todo",
  ["@comment.error"] = "DiagnosticError",
  ["@comment.warning"] = "DiagnosticWarn",
  ["@comment.note"] = "DiagnosticInfo",
  ["@tag"] = "Tag",
  ["@tag.builtin"] = "Tag",
  ["@tag.attribute"] = "Identifier",
  ["@tag.delimiter"] = "Delimiter",
  ["@property.json"] = "Tag",
  ["@string.special.key.json"] = "Tag",
  ["@property.css"] = "Constant",
  ["@markup.raw"] = "Constant",
  ["@markup.link"] = "Underlined",
  ["@markup.link.url"] = "Underlined",
  ["@markup.link.label"] = "String",
  ["@markup.quote"] = "Tag",
  ["@markup.list"] = "Type",
  ["@markup.list.checked"] = "Tag",
  ["@markup.list.unchecked"] = "Comment",
  ["@diff.plus"] = "Added",
  ["@diff.minus"] = "Removed",
  ["@diff.delta"] = "Changed",
}
for group, target in pairs(links) do
  hl(group, { link = target })
end
hl("@markup.heading", { fg = p.blue, bold = true })
hl("@markup.strong", { fg = p.variable, bold = true })
hl("@markup.italic", { fg = p.variable, italic = true })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.underline", { underline = true })
hl("@string.escape.regex", { fg = p.green, bold = true })
hl("@variable.parameter", { fg = p.orange })
hl("@keyword.operator", { fg = p.keyword_blue })

-- Keep language-server semantic tokens consistent with the syntax palette.
local semantic_links = {
  namespace = "@module",
  type = "@type",
  class = "@type",
  enum = "@type",
  interface = "@type",
  struct = "@type",
  typeParameter = "@type",
  enumMember = "@constant",
  event = "@type",
  ["function"] = "@function",
  method = "@function.method",
  macro = "@function.macro",
  keyword = "@keyword",
  modifier = "@keyword",
  comment = "@comment",
  string = "@string",
  number = "@number",
  regexp = "@string.regexp",
  operator = "@operator",
  decorator = "@attribute",
}
for token, target in pairs(semantic_links) do
  hl("@lsp.type." .. token, { link = target })
end
-- Generic tokens defer to Treesitter, which distinguishes calls and constructors better.
for _, token in ipairs({ "variable", "property", "parameter" }) do
  hl("@lsp.type." .. token, {})
end
hl("@lsp.type.selfParameter", { link = "Identifier" })
hl("@lsp.typemod.variable.readonly", { link = "Constant" })
hl("@lsp.typemod.variable.defaultLibrary", { link = "Special" })
hl("@lsp.typemod.function.defaultLibrary", { link = "Special" })
hl("@lsp.typemod.type.defaultLibrary", { link = "Special" })
hl("@lsp.typemod.class.defaultLibrary", { link = "Special" })
hl("@lsp.mod.deprecated", { fg = p.invalid, strikethrough = true })

-- Diagnostics, references, and version-control decorations.
local diagnostics = { Error = p.error, Warn = p.warning, Info = p.accent, Hint = p.muted, Ok = p.added }
for severity, color in pairs(diagnostics) do
  hl("Diagnostic" .. severity, { fg = color })
  hl("DiagnosticSign" .. severity, { fg = color })
  hl("DiagnosticUnderline" .. severity, { undercurl = true, sp = color })
  hl("DiagnosticVirtualText" .. severity, { fg = color, bg = blend(color .. "18") })
  hl("DiagnosticFloating" .. severity, { fg = color, bg = p.float })
end
hl("DiagnosticUnnecessary", { fg = p.disabled })
hl("DiagnosticDeprecated", { fg = p.invalid, strikethrough = true })
hl("LspInlayHint", { fg = p.muted })
hl("LspCodeLens", { fg = p.muted })
hl("LspReferenceText", { bg = blend("#27678250") })
hl("LspReferenceRead", { link = "LspReferenceText" })
hl("LspReferenceWrite", { bg = blend("#27678280") })
hl("LspSignatureActiveParameter", { fg = p.blue, bold = true })
hl("SpellBad", { undercurl = true, sp = p.error })
hl("SpellCap", { undercurl = true, sp = p.warning })
hl("SpellRare", { undercurl = true, sp = p.purple })
hl("SpellLocal", { undercurl = true, sp = p.accent })
hl("GitSignsAdd", { fg = p.added })
hl("GitSignsChange", { fg = "#0078D4" }) -- Inherited from Dark Modern.
hl("GitSignsDelete", { fg = p.deleted })
hl("DiffAdd", { bg = blend("#347D3926") })
hl("DiffDelete", { bg = blend("#C93C3726") })
hl("DiffChange", { bg = blend("#3994BC1A") })
hl("DiffText", { bg = blend("#57AB5A4D") })
hl("Added", { fg = p.green })
hl("Removed", { fg = p.invalid })
hl("Changed", { fg = p.orange })

-- Integrations used by this configuration; no plugin dependencies are required.
hl("SnacksPicker", { link = "NormalFloat" })
hl("SnacksPickerBorder", { link = "FloatBorder" })
hl("SnacksPickerTitle", { link = "FloatTitle" })
hl("SnacksPickerInput", { link = "NormalFloat" })
hl("SnacksPickerMatch", { fg = p.link, bold = true })
hl("SnacksPickerDir", { fg = p.muted })
hl("SnacksPickerFile", { fg = p.ui })
hl("SnacksPickerSelected", { fg = p.blue })
hl("SnacksPickerListCursorLine", { fg = "#EDEDED", bg = blend("#FFFFFF22", p.float) })
hl("SnacksPickerGitStatusAdded", { fg = "#73C991" })
hl("SnacksPickerGitStatusModified", { fg = p.warning })
hl("SnacksPickerGitStatusDeleted", { fg = p.error })
hl("SnacksPickerGitStatusUntracked", { fg = "#73C991" })
hl("SnacksPickerGitStatusIgnored", { fg = p.muted })
hl("SnacksIndent", { fg = blend("#8384854D") })
hl("SnacksIndentScope", { fg = "#838485" })
hl("SnacksTerminal", { fg = "#CCCCCC", bg = p.panel })
for severity, color in pairs({ Error = p.error, Warn = p.warning, Info = p.accent, Debug = p.muted, Trace = p.purple }) do
  hl("SnacksNotifierBorder" .. severity, { fg = color, bg = p.float })
end
hl("BlinkCmpMenu", { link = "Pmenu" })
hl("BlinkCmpMenuBorder", { link = "FloatBorder" })
hl("BlinkCmpMenuSelection", { link = "PmenuSel" })
hl("BlinkCmpLabel", { fg = p.ui })
hl("BlinkCmpLabelMatch", { fg = p.ui, bold = true })
hl("BlinkCmpLabelDeprecated", { fg = p.muted, strikethrough = true })
hl("BlinkCmpLabelDescription", { fg = p.muted })
hl("BlinkCmpDoc", { link = "NormalFloat" })
hl("BlinkCmpDocBorder", { link = "FloatBorder" })
hl("BlinkCmpSignatureHelp", { link = "NormalFloat" })
hl("BlinkCmpSignatureHelpBorder", { link = "FloatBorder" })
hl("BlinkCmpSignatureHelpActiveParameter", { link = "LspSignatureActiveParameter" })
hl("BlinkCmpGhostText", { fg = p.disabled })
hl("OilDir", { link = "Directory" })
hl("OilFile", { fg = p.ui })
hl("OilLink", { fg = p.link })
hl("RainbowDelimiterYellow", { fg = "#FFD700" })
hl("RainbowDelimiterViolet", { fg = "#DA70D6" })
hl("RainbowDelimiterBlue", { fg = "#179FFF" })
hl("WhichKey", { fg = p.blue })
hl("WhichKeyGroup", { fg = p.purple })
hl("WhichKeyDesc", { fg = p.ui })
hl("WhichKeySeparator", { fg = p.muted })
hl("WhichKeyNormal", { link = "NormalFloat" })

-- ANSI colors adapted from the palette for embedded terminal buffers.
local terminal_colors = {
  p.panel, p.red, p.green, p.warning, p.blue, p.purple, p.string, p.variable,
  p.disabled, p.invalid, p.added, p.orange, p.blue, p.purple, p.string, "#FFFFFF",
}
for i, color in ipairs(terminal_colors) do
  vim.g["terminal_color_" .. (i - 1)] = color
end
