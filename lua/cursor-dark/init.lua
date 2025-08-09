-- The main colorscheme module.
-- local M = {} is a common pattern to create a local table that will be returned
-- at the end of the file, effectively creating a module.
local M = {}

-- This is the default configuration for your colorscheme.
-- Users can override these options.
local default_options = {
  transparent = false,
  -- You can add other options here, for example:
  -- style = "dark", -- or "light"
  -- theme = "wave", -- or "solarized"
}

-- The setup function is the public API of your colorscheme.
-- Users will call this function to configure and load the colorscheme.
function M.setup(options)
  -- Merge the user-provided options with the defaults.
  -- This ensures that any options not specified by the user will use
  -- the default values.
  M.options = vim.tbl_deep_extend("force", default_options, options or {})

  -- Load the main colorscheme file.
  -- This will execute the code in lua/cursor-dark/cursor-dark.lua
  require("cursor-dark.cursor-dark")
end

-- Return the module so it can be required by other files.
return M
