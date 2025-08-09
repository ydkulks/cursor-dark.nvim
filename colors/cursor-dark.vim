" Vim color file
" Name: cursor-dark
" Maintainer: ydkulkarni(ydkulks2@gmail.com)
" License: MIT

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

" Define the color palette using hex codes.
" These are variables for convenience in Vimscript.
let s:black       = "#1e222a"
let s:white       = "#abb2bf"
let s:gray        = "#5c6370"
let s:blue        = "#61afef"
let s:green       = "#98c379"
let s:red         = "#e06c75"
let s:orange      = "#d19a66"
let s:purple      = "#c678dd"
let s:cyan        = "#56b6c2"
let s:selection   = "#383f4d"
let s:cursorline  = "#2c323c"
let s:visual      = "#383f4d"

" --- Basic UI Highlights ---
" The syntax for highlight command is:
" hi GroupName ctermfg=ColorNumber ctermbg=ColorNumber guifg=#hexcode guibg=#hexcode gui=style
"
" ctermfg/ctermbg are for terminal Vim, guifg/guibg are for GUI Vim (gVim, MacVim).
" You can use 256-color numbers or standard color names. Hex codes are preferred for guifg/guibg.

hi Normal       guifg=s:white    guibg=s:black
hi Cursor       guifg=s:black    guibg=s:white    gui=reverse
hi Visual       guifg=NONE       guibg=s:visual   gui=NONE
hi Comment      guifg=s:gray     gui=italic
hi LineNr       guifg=s:gray
hi StatusLine   guifg=s:white    guibg=s:gray
hi StatusLineNC guifg=s:gray     guibg=s:black
hi ColorColumn  guifg=NONE       guibg=s:cursorline
hi CursorLine   guifg=NONE       guibg=s:cursorline
hi CursorLineNr guifg=s:white    guibg=s:cursorline
hi Pmenu        guifg=s:white    guibg=s:cursorline
hi PmenuSel     guifg=s:black    guibg=s:blue
hi VertSplit    guifg=s:gray     guibg=s:black
hi NonText      guifg=s:gray     guibg=NONE
hi Folded       guifg=s:gray     guibg=s:cursorline
hi MatchParen   guifg=s:orange   guibg=NONE       gui=bold

" --- Syntax Highlights ---
" Link syntax groups to the base highlight groups.
" This is a very common and efficient practice in Vim colorschemes.
hi link String      s:green
hi link Character   String
hi link Number      s:orange
hi link Boolean     Number
hi link Keyword     s:purple
hi link Function    s:blue
hi link Identifier  s:red
hi link Operator    Normal
hi link Statement   Keyword
hi link PreProc     purple
hi link Type        purple
hi link Define      Keyword
hi link Error       guifg=s:red      guibg=s:black    gui=underline

" --- To make sure the colors work correctly in 256-color terminals, you should
" either define cterm colors explicitly or rely on the terminal to handle hex.
" Most modern terminals can handle it, but for a robust colorscheme,
" it's good practice to provide cterm colors.
"
" Example for a single highlight group:
" hi Normal ctermfg=252 ctermbg=234 guifg=s:white guibg=s:black

" To make your colorscheme more complete, you'll want to add many more highlight
" groups. You can find a list of all standard groups with `:h highlight-groups`.
" Don't forget to include groups for `git` diffs, `SpellCheck`, and other
" popular plugins if you want a polished look.

" You can also link groups to each other to save effort.
" Example:
" hi link Repeat Keyword
