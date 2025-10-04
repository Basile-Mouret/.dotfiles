-- ~/.config/nvim/lua/plugins/typst-preview.lua

return {
  'chomosuke/typst-preview.nvim',
  lazy = false, -- or ft = 'typst' if you want it to load only for typst files
  version = '1.*',
  opts = {
    open_cmd = "qutebrowser %s >/dev/null 2>&1 &", 
  }, -- lazy.nvim will implicitly call `setup {}`
  config = function(_, opts)
    require('typst-preview').setup(opts) 
    vim.keymap.set('n', '<leader>tp', '<cmd>TypstPreview<cr>', 
      { desc = 'Start Typst Preview'})
    vim.keymap.set('n', '<leader>ts', '<cmd>TypstPreviewStop<cr>', 
      { desc = 'Stop Typst Preview' })
  end,

}
