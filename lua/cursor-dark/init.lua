-- The main colorscheme module.
-- local M = {} is a common pattern to create a local table that will be returned
-- at the end of the file, effectively creating a module.
local M = {}

-- This is the default configuration for your `colorscheme`.
-- Users can override these options.
---@type {style: string, transparent: boolean, dashboard: boolean}
local default_options = {
  style = "dark",
  transparent = false,
  dashboard = false,
}

-- Setup function
---@param options { transparent: boolean, dashboard: boolean} Options to override default options
function M.setup(options)
  -- Merge user options with defaults
  M.options = vim.tbl_deep_extend("force", default_options, options or {})

  -- Load the selected theme module
  local theme_name = M.options.style
  local ok, theme = pcall(require, "cursor-dark.themes." .. theme_name)

  if not ok then
    vim.notify("[cursor-dark] Theme '" .. theme_name .. "' not found", vim.log.levels.ERROR)
    return
  end

  -- Call the theme's `set()` function, passing options like transparent
  theme.set(M.options)

  -- Set the colorscheme name for Neovim's tracking
  vim.g.colors_name = "cursor-" .. theme_name
end

-- Return the module so it can be required by other files.
return M
