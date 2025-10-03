-- treesitter is used for better syntax highlighting by understanding the code
--


return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup {
      -- Install parsers for these languages
      ensure_installed = { 
        "typst",
        "lua",
        "markdown",
      },
  }
  end
}
