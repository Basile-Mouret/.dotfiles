-- ~/.config/nvim/lua/plugins/mason.lua

return {
  "mason-org/mason.nvim",
  opts = {}, -- Empty opts means it will call setup{} with default options
  -- You might want to add dependencies here, like mason-lspconfig.nvim
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
  end,
}

