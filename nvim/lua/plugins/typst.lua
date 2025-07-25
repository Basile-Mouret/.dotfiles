-- ~/.config/nvim/lua/plugins/typst-preview.lua

return {
  'chomosuke/typst-preview.nvim',
  lazy = false, -- or ft = 'typst' if you want it to load only for typst files
  version = '1.*',
  opts = {
    open_cmd = "qutebrowser %s", 
  }, -- lazy.nvim will implicitly call `setup {}`
}
