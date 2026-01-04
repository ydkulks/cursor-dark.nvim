" Vim color file
"
" Name: cursor-dark
" Author: ydkulks (https://github.com/ydkulks)
" License: MIT
"
" Note: Based on the Cursor Dark theme from Cursor IDE.
" Learn more: https://medium.com/unixification/how-to-create-a-vim-colorscheme-6ee020b75624

" This is a guard to prevent the colorscheme from being loaded multiple times.
if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

" Set the colorscheme name.
let g:colors_name = "cursor-dark"

" Set the background. This is important for Vim to pick the right color palette.
set background=dark

" ctermfg/ctermbg are for terminal Vim, guifg/guibg are for GUI Vim (gVim, MacVim).
" You can use 256-color numbers or standard color names. Hex codes are preferred for guifg/guibg.

" Define the color palette using hex codes.
let s:background = { "gui": "#1A1A1A" }
let s:foreground = { "gui": "#D8DEE9" }
let s:cursorColor = { "gui": "#87C3FF" }
let s:selectionBackground = { "gui": "#2E2E2E" }
let s:brightBlack = { "gui": "#505050" }
let s:brightBlue = { "gui": "#85C1FC" }
let s:brightCyan = { "gui": "#83D6C5" }
let s:brightGreen = { "gui": "#A3BE8C" }
let s:brightPurple = { "gui": "#C582BF" }
let s:brightRed = { "gui": "#BF616A" }
let s:brightWhite = { "gui": "#D8DEE9" }
let s:brightYellow = { "gui": "#EBC88D" }
let s:darkBlack = { "gui": "#1F1F1F" }
let s:darkBlue = { "gui": "#1E252B" }
let s:darkGreen = { "gui": "#272E22" }
let s:darkRed = { "gui": "#361B1E" }
let s:darkYellow = { "gui": "#30291C" }
let s:black = { "gui": "#2A2A2A" }
let s:blue = { "gui": "#85C1FC" }
let s:cyan = { "gui": "#88C0D0" }
let s:green = { "gui": "#A3BE8C" }
let s:purple = { "gui": "#AA9BF5" }
let s:red = { "gui": "#BF616A" }
let s:white = { "gui": "#D8DEE9" }
let s:yellow = { "gui": "#EFB080" }

" Helper function to set the guifg/guibg values.
function! s:setGuiColor(group, style)
    exec "hi " a:group
          \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
          \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
          \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
          \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
endfunction

" --- UI Highlights ---
call s:setGuiColor("Normal", { "fg": s:foreground, "bg": s:background })
call s:setGuiColor("Cursor", { "gui": "reverse" })
call s:setGuiColor("lCursor", { "gui": "reverse" })
call s:setGuiColor("LineNr", { "fg": s:brightBlack })
call s:setGuiColor("StatusLine", { "fg": s:foreground, "bg": s:black })
call s:setGuiColor("StatusLineNC", { "fg": s:brightBlack, "bg": s:background })
call s:setGuiColor("Title", { "fg": s:blue, "gui": "bold" })
call s:setGuiColor("Visual", { "bg": s:selectionBackground })
call s:setGuiColor("VisualNC", { "fg": s:background, "bg": s:yellow })
call s:setGuiColor("MatchParen", { "gui": "underline" })
call s:setGuiColor("Pmenu", { "fg": s:white })
call s:setGuiColor("PmenuSel", { "fg": s:black, "bg": s:blue })
call s:setGuiColor("NonText", { "fg": s:brightBlack })
call s:setGuiColor("Folded", { "fg": s:brightBlack })
call s:setGuiColor("SignColumn", { "fg": s:brightBlack })
call s:setGuiColor("WinSeparator", { "fg": s:black })
call s:setGuiColor("Special", { "fg": s:purple })
call s:setGuiColor("SpecialKey", { "fg": s:brightBlack })
call s:setGuiColor("SpellBad", { "fg": s:red, "gui": "underline" })
call s:setGuiColor("SpellCap", { "fg": s:blue, "gui": "underline" })
call s:setGuiColor("SpellLocal", { "fg": s:cyan, "gui": "underline" })
call s:setGuiColor("SpellRare", { "fg": s:purple, "gui": "underline" })
call s:setGuiColor("Directory", { "fg": s:blue })
call s:setGuiColor("ErrorMsg", { "fg": s:red })
call s:setGuiColor("Search", { "fg": s:yellow, "bg": s:darkYellow })
call s:setGuiColor("CurSearch", { "fg": s:background, "bg": s:yellow })
call s:setGuiColor("MoreMsg", { "fg": s:cyan })
call s:setGuiColor("ModeMsg", { "fg": s:green })
call s:setGuiColor("Question", { "fg": s:cyan })
call s:setGuiColor("WarningMsg", { "fg": s:yellow })
call s:setGuiColor("Conceal", { "fg": s:black })
call s:setGuiColor("PmenuThumb", { "fg": s:black, "bg": s:blue })
call s:setGuiColor("QuickFixLine", { "fg": s:black, "bg": s:blue })
call s:setGuiColor("WinBar", { "fg": s:black, "bg": s:darkBlack })
call s:setGuiColor("WinBarNC", { "fg": s:black, "bg": s:darkBlack })
call s:setGuiColor("CursorLine", { "bg": s:darkBlack })
call s:setGuiColor("CursorColumn", { "bg": s:darkBlack })
call s:setGuiColor("CursorLineNr", { "fg": s:purple })
call s:setGuiColor("ColorColumn", { "bg": s:background })
call s:setGuiColor("NormalFloat", { "fg": s:foreground })
call s:setGuiColor("FloatBorder", { "fg": s:brightBlack })
call s:setGuiColor("FloatShadow", { "fg": s:black })
call s:setGuiColor("FloatShadowThrough", { "fg": s:black })
call s:setGuiColor("BlinkCmpMenuBorder", { "fg": s:brightBlack })
call s:setGuiColor("BlinkCmpDocBorder", { "fg": s:brightBlack })
call s:setGuiColor("DiffAdd", { "bg": s:darkGreen })
call s:setGuiColor("DiffChange", { "bg": s:darkYellow })
call s:setGuiColor("DiffDelete", { "bg": s:darkRed })
call s:setGuiColor("DiffText", { "bg": s:darkBlue })
call s:setGuiColor("GitSignsAdd", { "fg": s:green })
call s:setGuiColor("GitSignsChange", { "fg": s:yellow })
call s:setGuiColor("GitSignsDelete", { "fg": s:red })

" --- Syntax Highlights ---
call s:setGuiColor("Comment", { "fg": s:brightBlack, "gui": "italic" })
call s:setGuiColor("String", { "fg": s:brightPurple })
call s:setGuiColor("Number", { "fg": s:yellow })
call s:setGuiColor("Boolean", { "fg": s:white })
call s:setGuiColor("Keyword", { "fg": s:brightCyan })
call s:setGuiColor("Function", { "fg": s:yellow, "style": "bold" })
call s:setGuiColor("Identifier", { "fg": s:red })
call s:setGuiColor("Statement", { "fg": s:purple })
call s:setGuiColor("Operator", { "fg": s:yellow })
call s:setGuiColor("Type", { "fg": s:purple })
call s:setGuiColor("PreProc", { "fg": s:purple })
call s:setGuiColor("Constant", { "fg": s:purple })
call s:setGuiColor("Todo", { "fg": s:purple, "gui": "bold" })
call s:setGuiColor("Added", { "fg": s:green })
call s:setGuiColor("Removed", { "fg": s:red })
call s:setGuiColor("Changed", { "fg": s:yellow })
call s:setGuiColor("Error", { "fg": s:red, "bg": s:darkRed })

" --- Diagnostic ---
call s:setGuiColor("DiagnosticError", { "fg": s:red })
call s:setGuiColor("DiagnosticWarn", { "fg": s:yellow })
call s:setGuiColor("DiagnosticInfo", { "fg": s:blue })
call s:setGuiColor("DiagnosticHint", { "fg": s:cyan })
call s:setGuiColor("DiagnosticOk", { "fg": s:green })
call s:setGuiColor("DiagnosticUnderlineError", { "gui": "undercurl", "sp": s:red })
call s:setGuiColor("DiagnosticUnderlineWarn", { "gui": "undercurl", "sp": s:yellow })
call s:setGuiColor("DiagnosticUnderlineInfo", { "gui": "undercurl", "sp": s:blue })
call s:setGuiColor("DiagnosticUnderlineHint", { "gui": "undercurl", "sp": s:cyan })
call s:setGuiColor("DiagnosticDeprecated", { "fg": s:yellow, "gui": "strikethrough" })
call s:setGuiColor("RedrawDebugClear", { "bg": s:darkYellow })
call s:setGuiColor("RedrawDebugComposed", { "bg": s:darkGreen })
call s:setGuiColor("RedrawDebugRecompose", { "bg": s:darkRed })
