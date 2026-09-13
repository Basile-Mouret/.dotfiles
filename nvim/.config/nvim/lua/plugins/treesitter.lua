-- treesitter is used for better syntax highlighting by understanding the code
--


return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.config').setup {
      -- Install parsers for these languages
      ensure_installed = { 
        "typst",
        "lua",
        "markdown",
      },
      -- Enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- Enable smart indentation
      indent = {
        enable = true,
      },
    }
  end
}
