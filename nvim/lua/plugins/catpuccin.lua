return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Make sure it loads before other plugins that might set colors
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      integrations = {},
    })
    
    vim.cmd.colorscheme "catppuccin-mocha"
  end,
}
