local M = {}

-- Define the color palette.
-- You can use hex codes or standard Neovim color names.
-- It's a good practice to name them descriptively.
local palette = {
  background = "#1E2127",
  foreground = "#EBEEF4",
  cursorColor = "#A6BF91",
  selectionBackground = "#21252B",

  brightBlack = "#535D71",
  brightBlue = "#85A4C3",
  brightCyan = "#93BDBD",
  brightGreen = "#A6BF91",
  brightPurple = "#B692B0",
  brightRed = "#C06771",
  brightWhite = "#EBEEF4",
  brightYellow = "#EACC90",

  darkBlack = "#21252B",
  darkBlue = "#313C47",
  darkGreen = "#374030",
  darkRed = "#4F2A2F",
  darkYellow = "#4A402E",

  black = "#30353F",
  blue = "#85A4C3",
  cyan = "#8CC1D1",
  green = "#A6BF91",
  purple = "#82819F",
  red = "#C06771",
  white = "#E4E8F0",
  yellow = "#EACC90",
}

-- Define the highlight groups for different syntax elements.
-- This is a simplified example. You'll need to expand this for a complete colorscheme.
local highlights = {
  -- General UI highlights
  Normal = { fg = palette.foreground, bg = palette.background },
  Cursor = { fg = palette.background, bg = palette.cursorColor },
  LineNr = { fg = palette.brightBlack, bg = palette.background },
  StatusLine = { fg = palette.foreground, bg = palette.black },
  StatusLineNC = { fg = palette.brightBlack, bg = palette.background },
  Title = { fg = palette.blue, style = "bold" },
  Visual = { fg = "none", bg = palette.darkBlue },
  VisualNC = { fg = palette.background, bg = palette.yellow },
  MatchParen = { fg = palette.background, bg = palette.yellow, style = "bold" },
  Pmenu = { fg = palette.white, bg = "none" },
  PmenuSel = { fg = palette.black, bg = palette.blue },
  NonText = { fg = palette.brightBlack, bg = "none" },
  Folded = { fg = palette.brightBlack, bg = "none" },
  SignColumn = { fg = palette.brightBlack, bg = "none" },
  WinSeparator = { fg = palette.black, bg = "none" },
  Special = { fg = palette.cyan, bg = "none" },
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
  Conseal = { fg = palette.black, bg = "none" },
  PmenuThumb = { fg = palette.black, bg = palette.blue },
  QuickFixLine = { fg = palette.black, bg = palette.blue },
  WinBar = { fg = palette.black, bg = palette.darkBlack },
  WinBarNC = { fg = palette.black, bg = palette.darkBlack },

  -- CursorLine
  CursorLine = { bg = palette.selectionBackground },
  CursorColumn = { bg = palette.selectionBackground },
  CursorLineNr = { fg = palette.brightBlack, bg = palette.selectionBackground },
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

  -- Markdown
  ["@markup.link.label.markdown_inline"] = { fg = palette.blue, style = "bold" },
  ["@markup.link"] = { fg = palette.purple, style = "underline" },

  -- Syntax highlights
  Comment = { fg = palette.brightBlack, style = "italic" },
  String = { fg = palette.green },
  Number = { fg = palette.purple },
  Boolean = { fg = palette.yellow },
  Keyword = { fg = palette.purple },
  Function = { fg = palette.blue },
  Identifier = { fg = palette.red },
  Statement = { fg = palette.purple },
  Operator = { fg = palette.blue },
  Type = { fg = palette.brightBlue },
  PreProc = { fg = palette.brightPurple },
  Constant = { fg = palette.brightYellow },
  ["@variable"] = { fg = palette.white },
  ["@delimiter"] = { fg = palette.brightBlack },
  Todo = { fg = palette.yellow, style = "bold" },
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
}

-- The core function to set the colorscheme.
M.set = function()
  -- Clear all existing highlights before applying new ones.
  vim.cmd.highlight("clear")

  -- Check if the `transparent` option is set.
  -- This is how you would use the options passed from `init.lua`.
  if require("cursor-dark").options.transparent then
    highlights.Normal.bg = "none"
    highlights.StatusLine.bg = "none"
    highlights.StatusLineNC.bg = "none"
    -- highlights.CursorLine.bg = "none"
    highlights.Pmenu.bg = "none"
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

-- Call the main function to set the colorscheme when this file is loaded.
M.set()

-- Return the module.
return M
