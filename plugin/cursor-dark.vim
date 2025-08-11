" Set the filetype for this file.
" This helps Vim and Neovim identify it as a Vim plugin.
if exists("g:colors_name") && g:colors_name == "cursor-dark"
    finish
endif

" The main part of the plugin logic.
" If Neovim is running, try to load the Lua colorscheme.
if has("nvim")
  lua require("cursor-dark").setup({})
else
    " For regular Vim, we'll try to load the Vimscript file.
    " This is for backward compatibility.
    " The `colors/cursor-dark.vim` file should contain all the
    " highlight commands for Vim.
    try
        colorscheme cursor-dark
    catch
        " If the colorscheme file is not found, you can add a
        " simple highlight to indicate a problem.
        echohl ErrorMsg
        echom "Colorscheme 'cursor-dark' not found"
        echohl None
    endtry
endif

" Set the background to dark, which is a good practice for dark themes.
" This ensures the colorscheme is applied correctly.
set background=dark

" Set the colorscheme name for Vim's internal tracking.
let g:colors_name = "cursor-dark"
