-- Tomorrow themes ported from the Zed extension installed at:
-- /Users/erodriguez/Library/Application Support/Zed/extensions/installed/tomorrow-theme/themes/tomorrow.json
--
-- The tables below intentionally mirror the Zed theme keys for "Tomorrow Night"
-- and "Tomorrow". Alpha colors are composited over the relevant Zed background
-- because Neovim highlight groups use opaque RGB colors.

local M = {}

local zed = {
  night = {
    colors_name = "tomorrow_night",
    background = "dark",
    style = {
      ["background"] = "#1E1F21",
      ["border.focused"] = "#1C1D1F",
      ["border.variant"] = "#1C1D1F",
      ["conflict"] = "#FF5B69",
      ["created"] = "#B5BD68",
      ["deleted"] = "#C66",
      ["deleted.background"] = "#FF78822E",
      ["editor.active_line.background"] = "#373B4180",
      ["editor.active_line_number"] = "#FFF",
      ["editor.background"] = "#1E1F21",
      ["editor.document_highlight.bracket_background"] = "#81A2BE40",
      ["editor.document_highlight.read_background"] = "#81A2BE2E",
      ["editor.foreground"] = "#C5C8C6",
      ["editor.gutter.background"] = "#1E1F21",
      ["editor.indent_guide"] = "none",
      ["editor.indent_guide_active"] = "#F0C67480",
      ["editor.subheader.background"] = "#17181A50",
      ["element.hover"] = "#4D505740",
      ["element.selected"] = "#373B41C0",
      ["elevated_surface.background"] = "#17181A",
      ["error"] = "#C66",
      ["error.background"] = "#1E1F21",
      ["hidden"] = "#63666E",
      ["hint"] = "#63666E",
      ["hint.background"] = "#1E1F21",
      ["ignored"] = "#4D5057",
      ["info"] = "#81A2BE",
      ["info.background"] = "#81A2BE2E",
      ["modified"] = "#F0C674",
      ["panel.background"] = "#17181A",
      ["predictive"] = "#7C7C7C",
      ["search.match_background"] = "#F0C6743E",
      ["status_bar.background"] = "#17181A",
      ["success"] = "#B5BD68",
      ["tab.active_background"] = "#1C1D1F",
      ["tab.inactive_background"] = "#17181A",
      ["tab_bar.background"] = "#17181A",
      ["text"] = "#C5C8C6",
      ["text.accent"] = "#F0C674",
      ["text.disabled"] = "#565960",
      ["text.muted"] = "#FFFFFF8F",
      ["text.placeholder"] = "#FFFFFF50",
      ["title_bar.background"] = "#17181A",
      ["toolbar.background"] = "#1C1D1F",
      ["warning"] = "#F0C674",
      ["warning.background"] = "#1E1F21",
    },
    players = {
      background = "#373B41",
      cursor = "#8ABEB7",
      selection = "#373B41C0",
    },
    syntax = {
      boolean = { color = "#DE935F" },
      comment = { color = "#969896" },
      constant = { color = "#DE935F" },
      ["constant.builtin"] = { color = "#DE935F" },
      ["function"] = { color = "#85B7B1" },
      keyword = { color = "#B294BB" },
      lifetime = { color = "#81A2BE" },
      method = { color = "#85B7B1" },
      number = { color = "#DE935F" },
      property = { color = nil },
      ["punctuation.list_marker"] = { color = "#DE935F" },
      string = { color = "#B5BD68" },
      tag = { color = "#92B2CA" },
      title = { color = "#B294BB" },
      type = { color = "#DE935F" },
    },
    terminal = {
      black = "#000",
      red = "#FF9DA4",
      green = "#B5BD68",
      yellow = "#F0C674",
      blue = "#81A2BE",
      magenta = "#B294BB",
      cyan = "#8ABEB7",
      white = "#CCC",
      bright_black = "#FFFFFF40",
      bright_red = "#FF5B69",
      bright_green = "#AAB257",
      bright_yellow = "#EAB85B",
      bright_blue = "#7094B2",
      bright_magenta = "#A383AD",
      bright_cyan = "#7BB2AA",
      bright_white = "#F2F2F2",
    },
  },
  day = {
    colors_name = "tomorrow",
    background = "light",
    style = {
      ["background"] = "#FFF",
      ["border.focused"] = "#F2F2F2",
      ["border.variant"] = "#F2F2F2",
      ["conflict"] = "#A34141",
      ["created"] = "#849B00",
      ["deleted"] = "#D43E36",
      ["deleted.background"] = "#FF78823E",
      ["editor.active_line.background"] = "#F2F2F2",
      ["editor.background"] = "#FFF",
      ["editor.document_highlight.bracket_background"] = "#5286BC50",
      ["editor.foreground"] = "#60605F",
      ["editor.gutter.background"] = "#FFF",
      ["editor.indent_guide"] = "#00000050",
      ["editor.indent_guide_active"] = "#5286BC80",
      ["editor.subheader.background"] = "#F2F2F2",
      ["element.hover"] = "#FFF",
      ["element.selected"] = "#DEDEDEC0",
      ["elevated_surface.background"] = "#F2F2F2",
      ["error"] = "#D43E36",
      ["error.background"] = "#EAC5C3",
      ["hidden"] = "#63666E",
      ["hint"] = "#63666E",
      ["hint.background"] = "#5286BC50",
      ["ignored"] = "#8C8C8C",
      ["info"] = "#5286BC",
      ["info.background"] = "#5286BC2E",
      ["modified"] = "#5286BC",
      ["panel.background"] = "#F2F2F2",
      ["predictive"] = "#777",
      ["search.match_background"] = "#F0C6748F",
      ["status_bar.background"] = "#FAFAFA",
      ["success"] = "#849B00",
      ["tab.active_background"] = "#FAFAFA",
      ["tab.inactive_background"] = "#F2F2F2",
      ["tab_bar.background"] = "#F2F2F2",
      ["text"] = "#60605F",
      ["text.accent"] = "#5286BC",
      ["text.disabled"] = "#00000050",
      ["text.muted"] = "#00000071",
      ["text.placeholder"] = "#00000071",
      ["title_bar.background"] = "#F2F2F2",
      ["toolbar.background"] = "#F2F2F29F",
      ["warning"] = "#F0C674",
      ["warning.background"] = "#FCD890",
    },
    players = {
      background = "#DEDEDE",
      cursor = "#5286BC",
      selection = "#DEDEDE8F",
    },
    syntax = {
      boolean = { color = "#F39929" },
      comment = { color = "#9FA19E" },
      constant = { color = "#F39929" },
      ["constant.builtin"] = { color = "#F39929", font_weight = 600 },
      ["function"] = { color = "#4BA9AF", font_weight = 600 },
      keyword = { color = "#9C71B7", font_weight = 600 },
      lifetime = { color = "#5286BC" },
      number = { color = "#F39929" },
      ["punctuation.list_marker"] = { color = "#F39929" },
      string = { color = "#849B00" },
      tag = { color = "#5286BC" },
      title = { color = "#9C71B7", font_weight = 600 },
      type = { color = "#F39929", font_weight = 600 },
    },
    terminal = {
      black = "#000",
      red = "#BF4444",
      green = "#6E7F00",
      yellow = "#EAB85B",
      blue = "#47A",
      magenta = "#8D61AA",
      cyan = "#44979B",
      white = "#424242",
      bright_black = "#0000009F",
      bright_red = "#A34141",
      bright_green = "#5C6B00",
      bright_yellow = "#E8B04A",
      bright_blue = "#3E6C9B",
      bright_magenta = "#8456A3",
      bright_cyan = "#3D888C",
      bright_white = "#383838",
    },
  },
}

local function rgba(hex)
  if hex == nil or hex == "none" or hex == "false" then
    return nil
  end

  hex = hex:gsub("^#", "")
  if #hex == 3 or #hex == 4 then
    hex = hex:gsub(".", "%0%0")
  end

  local r = tonumber(hex:sub(1, 2), 16)
  local g = tonumber(hex:sub(3, 4), 16)
  local b = tonumber(hex:sub(5, 6), 16)
  local a = #hex == 8 and tonumber(hex:sub(7, 8), 16) or 255

  if not (r and g and b and a) then
    return nil
  end

  return r, g, b, a
end

local function rgb_hex(r, g, b)
  return string.format("#%02X%02X%02X", r, g, b)
end

local function color(hex, bg)
  local r, g, b, a = rgba(hex)
  if not r then
    return nil
  end
  if a == 255 then
    return rgb_hex(r, g, b)
  end

  local br, bgc, bb = rgba(bg or "#000000")
  local alpha = a / 255
  return rgb_hex(
    math.floor(r * alpha + br * (1 - alpha) + 0.5),
    math.floor(g * alpha + bgc * (1 - alpha) + 0.5),
    math.floor(b * alpha + bb * (1 - alpha) + 0.5)
  )
end

local function hl(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

local function setup_terminal(p)
  local bg = p.style["background"]
  local t = p.terminal
  local order = {
    "black", "red", "green", "yellow", "blue", "magenta", "cyan", "white",
    "bright_black", "bright_red", "bright_green", "bright_yellow",
    "bright_blue", "bright_magenta", "bright_cyan", "bright_white",
  }

  for i, key in ipairs(order) do
    vim.g["terminal_color_" .. (i - 1)] = color(t[key], bg)
  end
end

function M.setup(variant)
  local p = assert(zed[variant], "unknown Tomorrow variant: " .. tostring(variant))
  local s = p.style
  local syn = p.syntax
  local bg = s["editor.background"] or s.background

  local function c(key, over)
    return color(s[key], over or bg)
  end

  local function syntax_color(key, fallback)
    local item = syn[key]
    return color(item and item.color or fallback, bg)
  end

  local function syntax_bold(key)
    local item = syn[key]
    return item and item.font_weight and item.font_weight >= 600 or nil
  end

  vim.o.background = p.background
  vim.cmd.highlight("clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd.syntax("reset")
  end
  vim.g.colors_name = p.colors_name

  local editor_bg = c("editor.background")
  local editor_fg = c("editor.foreground")
  local panel_bg = c("panel.background")
  local elevated_bg = c("elevated_surface.background")
  local active_line = c("editor.active_line.background")
  local selection = color(p.players.selection, bg)
  local text = c("text")
  local text_accent = c("text.accent")
  local text_disabled = c("text.disabled")
  local muted = c("text.muted")
  local border = c("border.variant")
  local hover = c("element.hover")
  local selected = c("element.selected")

  -- Editor/UI: direct mappings from Zed editor.*, panel.*, tab.*, text.*, etc.
  hl("Normal", { fg = editor_fg, bg = editor_bg })
  hl("NormalNC", { fg = editor_fg, bg = editor_bg })
  hl("NormalFloat", { fg = editor_fg, bg = elevated_bg })
  hl("FloatBorder", { fg = border, bg = elevated_bg })
  hl("FloatTitle", { fg = text, bg = elevated_bg, bold = true })
  hl("Cursor", { fg = editor_bg, bg = color(p.players.cursor, bg) })
  hl("CursorLine", { bg = active_line })
  hl("CursorColumn", { bg = active_line })
  hl("LineNr", { fg = text_disabled, bg = c("editor.gutter.background") })
  hl("CursorLineNr", { fg = c("editor.active_line_number") or text_accent, bg = active_line, bold = true })
  hl("SignColumn", { bg = c("editor.gutter.background") })
  hl("ColorColumn", { bg = c("editor.subheader.background") })
  hl("Visual", { bg = selection })
  hl("VisualNOS", { bg = selection })
  hl("Search", { fg = text, bg = c("search.match_background") })
  hl("IncSearch", { fg = editor_bg, bg = c("warning") })
  hl("CurSearch", { fg = editor_bg, bg = c("warning") })
  hl("MatchParen", { fg = text, bg = c("editor.document_highlight.bracket_background") or selected, bold = true })
  hl("NonText", { fg = c("hidden") })
  hl("Whitespace", { fg = c("editor.indent_guide") or c("ignored") })
  hl("EndOfBuffer", { fg = editor_bg })
  hl("Folded", { fg = muted, bg = panel_bg })
  hl("FoldColumn", { fg = text_disabled, bg = editor_bg })
  hl("Directory", { fg = c("info") })
  hl("Question", { fg = c("success") })
  hl("MoreMsg", { fg = c("success") })
  hl("ModeMsg", { fg = text })

  -- Menus/popups
  hl("Pmenu", { fg = text, bg = elevated_bg })
  hl("PmenuSel", { fg = text, bg = selected })
  hl("PmenuSbar", { bg = hover })
  hl("PmenuThumb", { bg = muted })
  hl("WildMenu", { fg = text, bg = selected })

  -- Splits/status/tabline
  hl("WinSeparator", { fg = border })
  hl("StatusLine", { fg = text, bg = c("status_bar.background") })
  hl("StatusLineNC", { fg = muted, bg = c("status_bar.background") })
  hl("TabLine", { fg = muted, bg = c("tab.inactive_background") })
  hl("TabLineSel", { fg = text, bg = c("tab.active_background") })
  hl("TabLineFill", { bg = c("tab_bar.background") })

  -- Vim syntax: direct mappings from Zed syntax.*.
  hl("Comment", { fg = syntax_color("comment") })
  hl("Constant", { fg = syntax_color("constant") })
  hl("String", { fg = syntax_color("string") })
  hl("Character", { fg = syntax_color("string") })
  hl("Number", { fg = syntax_color("number") })
  hl("Boolean", { fg = syntax_color("boolean") })
  hl("Float", { fg = syntax_color("number") })
  hl("Identifier", { fg = editor_fg })
  hl("Function", { fg = syntax_color("function"), bold = syntax_bold("function") })
  hl("Statement", { fg = syntax_color("keyword"), bold = syntax_bold("keyword") })
  hl("Conditional", { fg = syntax_color("keyword"), bold = syntax_bold("keyword") })
  hl("Repeat", { fg = syntax_color("keyword"), bold = syntax_bold("keyword") })
  hl("Label", { fg = syntax_color("keyword") })
  hl("Operator", { fg = editor_fg })
  hl("Keyword", { fg = syntax_color("keyword"), bold = syntax_bold("keyword") })
  hl("Exception", { fg = c("error") })
  hl("PreProc", { fg = syntax_color("keyword") })
  hl("Include", { fg = syntax_color("keyword"), bold = syntax_bold("keyword") })
  hl("Define", { fg = syntax_color("keyword") })
  hl("Macro", { fg = syntax_color("keyword") })
  hl("Type", { fg = syntax_color("type"), bold = syntax_bold("type") })
  hl("StorageClass", { fg = syntax_color("keyword") })
  hl("Structure", { fg = syntax_color("type"), bold = syntax_bold("type") })
  hl("Typedef", { fg = syntax_color("type"), bold = syntax_bold("type") })
  hl("Special", { fg = syntax_color("lifetime") or text_accent })
  hl("SpecialChar", { fg = syntax_color("punctuation.list_marker") })
  hl("Tag", { fg = syntax_color("tag") })
  hl("Delimiter", { fg = editor_fg })
  hl("SpecialComment", { fg = syntax_color("comment") })
  hl("Debug", { fg = c("error") })
  hl("Underlined", { fg = syntax_color("lifetime") or c("info"), underline = true })
  hl("Error", { fg = c("error") })
  hl("Todo", { fg = c("warning"), bold = true })

  -- Treesitter: mapped to the nearest Zed syntax scopes.
  hl("@variable", { fg = editor_fg })
  hl("@variable.builtin", { fg = syntax_color("constant.builtin"), bold = syntax_bold("constant.builtin") })
  hl("@variable.parameter", { fg = editor_fg })
  hl("@variable.member", { fg = syntax_color("property", editor_fg) })
  hl("@constant", { fg = syntax_color("constant") })
  hl("@constant.builtin", { fg = syntax_color("constant.builtin"), bold = syntax_bold("constant.builtin") })
  hl("@module", { fg = editor_fg })
  hl("@label", { fg = syntax_color("keyword") })
  hl("@string", { fg = syntax_color("string") })
  hl("@string.escape", { fg = syntax_color("punctuation.list_marker") })
  hl("@character", { fg = syntax_color("string") })
  hl("@number", { fg = syntax_color("number") })
  hl("@boolean", { fg = syntax_color("boolean") })
  hl("@type", { fg = syntax_color("type"), bold = syntax_bold("type") })
  hl("@type.builtin", { fg = syntax_color("type"), bold = syntax_bold("type") })
  hl("@attribute", { fg = syntax_color("type") })
  hl("@property", { fg = syntax_color("property", editor_fg) })
  hl("@function", { fg = syntax_color("function"), bold = syntax_bold("function") })
  hl("@function.builtin", { fg = syntax_color("function"), bold = syntax_bold("function") })
  hl("@function.call", { fg = syntax_color("function"), bold = syntax_bold("function") })
  hl("@function.method", { fg = syntax_color("method", syntax_color("function")) })
  hl("@function.method.call", { fg = syntax_color("method", syntax_color("function")) })
  hl("@constructor", { fg = syntax_color("type"), bold = syntax_bold("type") })
  hl("@keyword", { fg = syntax_color("keyword"), bold = syntax_bold("keyword") })
  hl("@keyword.function", { fg = syntax_color("keyword"), bold = syntax_bold("keyword") })
  hl("@keyword.import", { fg = syntax_color("keyword"), bold = syntax_bold("keyword") })
  hl("@keyword.conditional", { fg = syntax_color("keyword"), bold = syntax_bold("keyword") })
  hl("@keyword.repeat", { fg = syntax_color("keyword"), bold = syntax_bold("keyword") })
  hl("@keyword.operator", { fg = syntax_color("keyword"), bold = syntax_bold("keyword") })
  hl("@operator", { fg = editor_fg })
  hl("@punctuation.delimiter", { fg = editor_fg })
  hl("@punctuation.bracket", { fg = editor_fg })
  hl("@punctuation.special", { fg = syntax_color("punctuation.list_marker") })
  hl("@comment", { fg = syntax_color("comment") })
  hl("@comment.todo", { fg = c("warning"), bold = true })
  hl("@comment.error", { fg = c("error"), bold = true })
  hl("@comment.warning", { fg = c("warning"), bold = true })
  hl("@comment.note", { fg = c("info"), bold = true })
  hl("@markup.heading", { fg = syntax_color("title"), bold = syntax_bold("title") or true })
  hl("@markup.link", { fg = syntax_color("lifetime") or c("info"), underline = true })
  hl("@markup.raw", { fg = syntax_color("string") })
  hl("@tag", { fg = syntax_color("tag") })
  hl("@tag.attribute", { fg = syntax_color("type") })
  hl("@tag.delimiter", { fg = editor_fg })

  -- Diagnostics/LSP: Zed error/warning/info/hint/success colors.
  hl("DiagnosticError", { fg = c("error") })
  hl("DiagnosticWarn", { fg = c("warning") })
  hl("DiagnosticInfo", { fg = c("info") })
  hl("DiagnosticHint", { fg = c("hint") })
  hl("DiagnosticOk", { fg = c("success") })
  hl("DiagnosticUnderlineError", { undercurl = true, sp = c("error") })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c("warning") })
  hl("DiagnosticUnderlineInfo", { undercurl = true, sp = c("info") })
  hl("DiagnosticUnderlineHint", { undercurl = true, sp = c("hint") })
  hl("DiagnosticVirtualTextError", { fg = c("error"), bg = c("error.background") })
  hl("DiagnosticVirtualTextWarn", { fg = c("warning"), bg = c("warning.background") })
  hl("DiagnosticVirtualTextInfo", { fg = c("info"), bg = c("info.background") })
  hl("DiagnosticVirtualTextHint", { fg = c("hint"), bg = c("hint.background") })
  hl("DiagnosticUnnecessary", { fg = c("predictive") or c("ignored") })
  hl("LspInlayHint", { fg = c("predictive") or c("hint"), bg = "NONE" })
  hl("LspReferenceText", { bg = c("editor.document_highlight.read_background") or c("editor.document_highlight.bracket_background") })
  hl("LspReferenceRead", { bg = c("editor.document_highlight.read_background") or c("editor.document_highlight.bracket_background") })
  hl("LspReferenceWrite", { bg = selected })

  -- Git/diffs: Zed created/modified/deleted/conflict fields.
  hl("GitSignsAdd", { fg = c("created") })
  hl("GitSignsChange", { fg = c("modified") })
  hl("GitSignsDelete", { fg = c("deleted") })
  hl("DiffAdd", { fg = c("created") })
  hl("DiffChange", { fg = c("modified") })
  hl("DiffDelete", { fg = c("deleted"), bg = c("deleted.background") })
  hl("DiffText", { fg = c("modified"), bg = c("search.match_background") })
  hl("Added", { fg = c("created") })
  hl("Changed", { fg = c("modified") })
  hl("Removed", { fg = c("deleted") })

  -- Plugin UI groups reuse Zed panel/elevated/element/text mappings.
  hl("SnacksPicker", { fg = text, bg = elevated_bg })
  hl("SnacksPickerBorder", { fg = border, bg = elevated_bg })
  hl("SnacksPickerTitle", { fg = text, bg = elevated_bg, bold = true })
  hl("SnacksPickerInput", { fg = text, bg = elevated_bg })
  hl("SnacksPickerMatch", { fg = text_accent, bold = true })
  hl("SnacksPickerDir", { fg = c("hidden") or c("ignored") })
  hl("SnacksPickerFile", { fg = text })
  hl("SnacksIndent", { fg = c("editor.indent_guide") or c("ignored") })
  hl("SnacksIndentScope", { fg = c("editor.indent_guide_active") or text_accent })
  hl("SnacksNotifierBorderError", { fg = c("error") })
  hl("SnacksNotifierBorderWarn", { fg = c("warning") })
  hl("SnacksNotifierBorderInfo", { fg = c("info") })
  hl("SnacksNotifierBorderDebug", { fg = c("ignored") })
  hl("SnacksNotifierBorderTrace", { fg = syntax_color("keyword") })

  hl("BlinkCmpMenu", { fg = text, bg = elevated_bg })
  hl("BlinkCmpMenuBorder", { fg = border, bg = elevated_bg })
  hl("BlinkCmpMenuSelection", { fg = text, bg = selected })
  hl("BlinkCmpLabelMatch", { fg = text_accent, bold = true })
  hl("BlinkCmpDoc", { fg = text, bg = elevated_bg })
  hl("BlinkCmpDocBorder", { fg = border, bg = elevated_bg })
  hl("BlinkCmpSignatureHelp", { fg = text, bg = elevated_bg })
  hl("BlinkCmpSignatureHelpBorder", { fg = border, bg = elevated_bg })

  hl("WhichKey", { fg = text_accent })
  hl("WhichKeyGroup", { fg = syntax_color("keyword") })
  hl("WhichKeyDesc", { fg = text })
  hl("TodoBgTODO", { fg = editor_bg, bg = c("warning"), bold = true })
  hl("TodoBgFIX", { fg = editor_bg, bg = c("error"), bold = true })
  hl("TodoBgNOTE", { fg = editor_bg, bg = c("info"), bold = true })

  setup_terminal(p)
end

return M
