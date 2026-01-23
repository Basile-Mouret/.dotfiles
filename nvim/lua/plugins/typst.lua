-- ~/.config/nvim/lua/plugins/typst-preview.lua

return {
  'chomosuke/typst-preview.nvim',
  lazy = false,
  version = '1.*',
  opts = {
    open_cmd = "qutebrowser %s >/dev/null 2>&1 &",
    
    -- === NEW: Add this function to fix the root path ===
    get_root = function(path_of_main_file)
      -- Search upward for typst.toml or .git
      local root = vim.fs.find({'typst.toml', '.git'}, { path = path_of_main_file, upward = true })[1]
      if root then
        return vim.fs.dirname(root)
      end
      -- Fallback to current working directory
      return vim.fn.getcwd()
    end,
    -- =================================================
  }, 
  config = function(_, opts)
    require('typst-preview').setup(opts)
    vim.keymap.set('n', '<leader>tp', '<cmd>TypstPreview<cr>', { desc = 'Start Typst Preview'})
    vim.keymap.set('n', '<leader>ts', '<cmd>TypstPreviewStop<cr>', { desc = 'Stop Typst Preview' })
  end,
}
