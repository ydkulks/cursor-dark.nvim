local M = {}

-- Define the color palette.
-- You can use hex codes or standard Neovim color names.
-- It's a good practice to name them descriptively.
local palette = {
  background = "#1A1A1A",
  foreground = "#D8DEE9",
  cursorColor = "#87C3FF",
  selectionBackground = "#2E2E2E",

  brightBlack = "#505050",
  brightBlue = "#85C1FC",
  brightCyan = "#83D6C5",
  brightGreen = "#A3BE8C",
  brightPurple = "#C582BF",
  brightRed = "#BF616A",
  brightWhite = "#D8DEE9",
  brightYellow = "#EBC88D",

  darkBlack = "#1F1F1F",
  darkBlue = "#1E252B",
  darkGreen = "#272E22",
  darkRed = "#361B1E",
  darkYellow = "#30291C",

  black = "#2A2A2A",
  blue = "#85C1FC",
  cyan = "#88C0D0",
  green = "#A3BE8C",
  purple = "#AA9BF5",
  red = "#BF616A",
  white = "#D8DEE9",
  yellow = "#EFB080",
}

-- Define the highlight groups for different syntax elements.
-- This is a simplified example. You'll need to expand this for a complete colorscheme.
local highlights = {
  -- General UI highlights
  Normal = { fg = palette.foreground, bg = palette.background },
  Cursor = { style = "reverse" },
  lCursor = { style = "reverse" },
  LineNr = { fg = palette.brightBlack, bg = "none" },
  StatusLine = { fg = palette.foreground, bg = palette.black },
  StatusLineNC = { fg = palette.brightBlack, bg = palette.background },
  Title = { fg = palette.blue, style = "bold" },
  Visual = { fg = "none", bg = palette.selectionBackground },
  VisualNC = { fg = palette.background, bg = palette.yellow },
  MatchParen = { style = "underline" },
  Pmenu = { fg = palette.white, bg = "none" },
  PmenuSel = { fg = palette.black, bg = palette.blue },
  NonText = { fg = palette.brightBlack, bg = "none" },
  Folded = { fg = palette.brightBlack, bg = "none" },
  SignColumn = { fg = palette.brightBlack, bg = "none" },
  WinSeparator = { fg = palette.black, bg = "none" },
  Special = { fg = palette.purple, bg = "none" },
  SpecialKey = { fg = palette.brightBlack, bg = "none" },
  SpellBad = { fg = palette.red, bg = "none", style = "underline" },
  SpellCap = { fg = palette.blue, bg = "none", style = "underline" },
  SpellLocal = { fg = palette.cyan, bg = "none", style = "underline" },
  SpellRare = { fg = palette.purple, bg = "none", style = "underline" },
  Directory = { fg = palette.blue, bg = "none" },
  ErrorMsg = { fg = palette.red, bg = "none" },
  Search = { fg = palette.yellow, bg = palette.darkYellow },
  CurSearch = { fg = palette.background, bg = palette.yellow },
  MoreMsg = { fg = palette.cyan, bg = "none" },
  ModeMsg = { fg = palette.green, bg = "none" },
  Question = { fg = palette.cyan, bg = "none" },
  WarningMsg = { fg = palette.yellow, bg = "none" },
  Conceal = { fg = palette.black, bg = "none" },
  PmenuThumb = { fg = palette.black, bg = palette.blue },
  QuickFixLine = { fg = palette.black, bg = palette.blue },
  WinBar = { fg = palette.black, bg = palette.darkBlack },
  WinBarNC = { fg = palette.black, bg = palette.darkBlack },

  -- CursorLine
  CursorLine = { bg = palette.darkBlack },
  CursorColumn = { bg = palette.darkBlack },
  CursorLineNr = { fg = palette.purple, bg = "none" },
  ColorColumn = { fg = "none", bg = palette.background },

  -- Floats
  NormalFloat = { fg = palette.foreground, bg = "none" },
  FloatBorder = { fg = palette.brightBlack, bg = "none" },
  FloatShadow = { fg = palette.black, bg = "none" },
  FloatShadowThrough = { fg = palette.black, bg = "none" },
  BlinkCmpMenuBorder = { fg = palette.brightBlack, bg = "none" },
  BlinkCmpDocBorder = { fg = palette.brightBlack, bg = "none" },

  -- Diffs
  DiffAdd = { fg = "none", bg = palette.darkGreen },
  DiffChange = { fg = "none", bg = palette.darkYellow },
  DiffDelete = { fg = "none", bg = palette.darkRed },
  DiffText = { fg = "none", bg = palette.darkBlue },

  -- Git signs
  GitSignsAdd = { fg = palette.green, bg = "none" },
  GitSignsChange = { fg = palette.yellow, bg = "none" },
  GitSignsDelete = { fg = palette.red, bg = "none" },

  -- Syntax highlights
  Comment = { fg = palette.brightBlack, style = "italic" },
  String = { fg = palette.brightPurple },
  Number = { fg = palette.yellow },
  Boolean = { fg = palette.white },
  Keyword = { fg = palette.brightCyan },
  Function = { fg = palette.yellow, style = "bold" },
  Identifier = { fg = palette.red },
  Statement = { fg = palette.purple },
  Operator = { fg = palette.yellow },
  Type = { fg = palette.purple },
  PreProc = { fg = palette.purple },
  Constant = { fg = palette.purple },
  Todo = { fg = palette.purple, style = "bold" },
  Added = { fg = palette.green },
  Removed = { fg = palette.red },
  Changed = { fg = palette.yellow },

  -- Diagnostic
  DiagnosticError = { fg = palette.red },
  DiagnosticWarn = { fg = palette.yellow },
  DiagnosticInfo = { fg = palette.blue },
  DiagnosticHint = { fg = palette.cyan },
  DiagnosticOk = { fg = palette.green },
  DiagnosticUnderlineError = { style = "undercurl", sp = palette.red },
  DiagnosticUnderlineWarn = { style = "undercurl", sp = palette.yellow },
  DiagnosticUnderlineInfo = { style = "undercurl", sp = palette.blue },
  DiagnosticUnderlineHint = { style = "undercurl", sp = palette.cyan },
  DiagnosticDeprecated = { fg = palette.yellow, style = "strikethrough" },
  RedrawDebugClear = { bg = palette.darkYellow },
  RedrawDebugComposed = { bg = palette.darkGreen },
  RedrawDebugRecompose = { bg = palette.darkRed },
  Error = { fg = palette.red, bg = palette.darkRed },

  -- Treesitter
  ["@variable"] = { fg = palette.white },
  ["@variable.builtin"] = { fg = palette.white },
  ["@variable.parameter.builtin"] = { fg = palette.white },
  ["@constant"] = { fg = palette.purple },
  ["@constant.builtin"] = { fg = palette.purple },
  ["@module"] = { fg = palette.brightPurple },
  ["@module.builtin"] = { fg = palette.brightPurple },
  ["@label"] = { fg = palette.blue },
  ["@label.builtin"] = { fg = palette.blue },
  ["@delimiter"] = { fg = palette.brightBlack },
  ["@string"] = { fg = palette.brightPurple },
  ["@string.builtin"] = { fg = palette.brightPurple },
  ["@string.regex"] = { fg = palette.brightPurple },
  ["@string.regexp"] = { fg = palette.brightPurple },
  ["@string.special"] = { fg = palette.purple },
  ["@string.escape"] = { fg = palette.purple },
  ["@string.special.url"] = { fg = palette.cyan },
  ["@character"] = { fg = palette.yellow },
  ["@character.special"] = { fg = palette.purple },
  ["@boolean"] = { fg = palette.white },
  ["@number"] = { fg = palette.yellow },
  ["@number.float"] = { fg = palette.yellow },
  ["@type"] = { fg = palette.purple },
  ["@type.builtin"] = { fg = palette.purple },
  ["@attribute"] = { fg = palette.purple },
  ["@attribute.builtin"] = { fg = palette.purple },
  ["@property"] = { fg = palette.red },
  ["@function"] = { fg = palette.yellow, style = "bold" },
  ["@function.builtin"] = { fg = palette.yellow, style = "bold" },
  ["@constructor"] = { fg = palette.purple },
  ["@operator"] = { fg = palette.yellow },
  ["@keyword"] = { fg = palette.brightCyan },
  ["@punctuation"] = { fg = palette.white },
  ["@punctuation.special"] = { fg = palette.white },
  -- Comments
  ["@comment"] = { fg = palette.brightBlack },
  ["@comment.error"] = { fg = palette.red },
  ["@comment.warning"] = { fg = palette.yellow },
  ["@comment.note"] = { fg = palette.blue },
  ["@comment.todo"] = { fg = palette.yellow, style = "bold" },
  -- Markdown
  ["@markup"] = { fg = palette.blue },
  ["@markup.strong"] = { style = "bold" },
  ["@markup.italic"] = { style = "italic" },
  ["@markup.strikethrough"] = { style = "strikethrough" },
  ["@markup.link.label.markdown_inline"] = { fg = palette.brightCyan, style = "bold" },
  ["@markup.underline"] = { style = "underline" },
  ["@markup.heading"] = { fg = palette.purple, style = "bold" },
  ["@markup.link"] = { fg = palette.cyan, style = "underline" },
  ["@markup.heading.1.delimiter.vimdoc"] = { fg = palette.purple, style = "bold" },
  ["@markup.heading.2.delimiter.vimdoc"] = { fg = palette.cyan, style = "bold" },
  -- Diff
  ["@diff"] = { fg = palette.brightBlack },
  ["@diff.plus"] = { fg = palette.green },
  ["@diff.minus"] = { fg = palette.red },
  ["@diff.delta"] = { fg = palette.yellow },
  -- Tags
  ["@tag"] = { fg = palette.purple },
  ["@tag.builtin"] = { fg = palette.purple },
  -- LSP
  ["@lsp"] = { fg = palette.white },
  ["@lsp.type.class"] = { fg = palette.brightBlue },
  ["@lsp.type.comment"] = { fg = palette.brightBlack },
  ["@lsp.type.decorator"] = { fg = palette.brightPurple },
  ["@lsp.type.enum"] = { fg = palette.brightBlue },
  ["@lsp.type.enumMember"] = { fg = palette.brightBlue },
  ["@lsp.type.event"] = { fg = palette.brightBlue },
  ["@lsp.type.function"] = { fg = palette.yellow, style = "bold" },
  ["@lsp.type.interface"] = { fg = palette.brightBlue },
  ["@lsp.type.keyword"] = { fg = palette.brightCyan },
  ["@lsp.type.macro"] = { fg = palette.cyan },
  ["@lsp.type.method"] = { fg = palette.yellow },
  ["@lsp.type.modifier"] = { fg = palette.yellow },
  ["@lsp.type.namespace"] = { fg = palette.brightBlue },
  ["@lsp.type.number"] = { fg = palette.yellow },
  ["@lsp.type.operator"] = { fg = palette.yellow },
  ["@lsp.type.parameter"] = { fg = palette.purple },
  ["@lsp.type.property"] = { fg = palette.red },
  ["@lsp.type.regexp"] = { fg = palette.brightPurple },
  ["@lsp.type.string"] = { fg = palette.brightPurple },
  ["@lsp.type.struct"] = { fg = palette.brightBlue },
  ["@lsp.type.type"] = { fg = palette.purple },
  ["@lsp.type.typeParameter"] = { fg = palette.purple },
  ["@lsp.type.variable"] = { fg = palette.white },
  ["@lsp.mod.deprecated"] = { fg = palette.yellow, style = "strikethrough" },

}

-- The core function to set the colorscheme.
M.set = function(options)
  -- Clear all existing highlights before applying new ones.
  vim.cmd.highlight("clear")

  -- Check if the `transparent` option is set.
  -- This is how you would use the options passed from `init.lua`.
  options = options or {}
  if options.transparent then
    highlights.Normal.bg = "none"
    highlights.StatusLine.bg = "none"
    highlights.StatusLineNC.bg = "none"
    -- highlights.CursorLine.bg = "none" -- deprecated
    highlights.Pmenu.bg = "none"
  end

  -- Check if `dashboard` option is set.
  if options.dashboard then
    highlights.DashboardHeader = { fg = palette.blue, style = "bold" }
    highlights.DashboardIcon = { fg = palette.blue, style = "bold" }
    highlights.DashboardShortCut = { fg = palette.blue, style = "bold" }
    highlights.DashboardDesc = { fg = palette.blue, style = "bold" }
    highlights.DashboardKey = { fg = palette.blue, style = "bold" }
    highlights.DashboardFooter = { bg = "none", fg = "#545c7e" }
  end


  -- Loop through the defined highlights and apply them.
  for group, props in pairs(highlights) do
    local cmd = "highlight"
    -- Add the highlight group name.
    cmd = cmd .. " " .. group

    -- Add the foreground color.
    if props.fg then
      cmd = cmd .. " guifg=" .. props.fg
    end

    -- Add the background color.
    if props.bg then
      cmd = cmd .. " guibg=" .. props.bg
    end

    -- Add the style (e.g., italic, bold).
    if props.style then
      cmd = cmd .. " gui=" .. props.style
    end

    -- Execute the command.
    vim.cmd(cmd)
  end
end

-- Return the module.
return M
