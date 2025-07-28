-- ~/.config/nvim/lua/plugins/catppuccin.lua

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Make sure it loads before other plugins that might set colors
  config = function()
    -- Optional: Configure Catppuccin if you need to
    -- require("catppuccin").setup({
    --   flavour = "mocha", -- latte, frappe, macchiato, mocha
    --   background = { -- :h catppuccin-colors
    --     light = "latte",
    --     dark = "mocha",
    --   },
    transparent_background = true,
    --   show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    --   term_colors = true,
    --   dim_inactive = {
    --     enabled = false,
    --     shade = "dark",
    --     percentage = 0.15,
    --   },
    --   no_italic = false, -- Force no italic for comments and more
    --   no_bold = false, -- Force no bold for anything
    --   integrations = {
    --     cmp = true,
    --     gitsigns = true,
    --     nvimtree = true,
    --     telescope = true,
    --     -- For example, if you use mini.nvim components, they often integrate automatically
    --     -- or you might need specific settings if they are exposed.
    --   },
    -- })

    -- Apply the colorscheme
    vim.cmd.colorscheme "catppuccin-mocha"
  end,
}
