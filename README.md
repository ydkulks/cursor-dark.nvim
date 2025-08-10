# cursor-dark.nvim

A dark colorscheme for Neovim and Vim inspired by Cursor's dark and dark midnight themes.

## ✨ Features

- Inspired by Cursor: A faithful reproduction of the clean, low-contrast color palette found in the Cursor editor.
- Cross-Platform: Works on both Neovim (with Lua configuration) and Vim (with Vimscript).
- Customizable: Allows for a transparent background and other future customizations via a simple setup function.
- Tree-sitter Support: Includes syntax highlighting for common Tree-sitter languages to provide a modern editing experience.
- Plugin Integration: Provides sensible defaults and theme overrides for popular plugins like nvimdev/dashboard-nvim to ensure a consistent look.

## 📸 Screenshot

Here's a preview of the colorscheme in action.

## 📦 Installation

Use your favorite plugin manager to install cursor-dark.nvim.

- lazy.nvim

```lua

return {
  -- Your other plugins...

  {
    "ydkulks/cursor-dark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cursor-dark").setup({
        -- For a transparent background
        transparent = true,
      })
    end,
  },
}
```

- vim-plug

```vim
" In your .vimrc or init.vim
Plug 'your-github-username/cursor-dark.nvim'

" After installing, add this to your configuration
colorscheme cursor-dark
```

## ⚙️ Configuration

You can customize the colorscheme by passing a table of options to the setup function.
```lua

require("cursor-dark").setup({
  -- Set to `true` to make the background transparent
  transparent = false,
})
```

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE.md) file for details.
