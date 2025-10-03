-- ~/.config/nvim/lua/plugins/mini.lua

return {
  'echasnovski/mini.nvim',
  version = '*', -- Use latest stable release
  config = function()
    -- Mini.nvim modules you use and their configurations
    -- require('mini.snippets').setup({})
    -- require('mini.completion').setup({})
    require('mini.files').setup({})
    require('mini.pick').setup({})
    require('mini.icons').setup({})

    -- Mini.nvim related keymaps
    vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>', {desc = 'File explorer'})
    vim.keymap.set('n', '<leader><space>', '<cmd>Pick buffers<cr>', {desc = 'Search open files'})
    vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<cr>', {desc = 'Search all files'})
    vim.keymap.set('n', '<leader>fh', '<cmd>Pick help<cr>', {desc = 'Search help tags'})
  end,
}
