-- ~/.config/nvim/lua/config/options.lua

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.signcolumn = 'yes'
vim.o.undofile = true -- Persistent undo
vim.o.updatetime = 300 -- Faster completion and LSP updates
vim.o.termguicolors = true -- Enable true colors 
vim.opt.scrolloff = 4

-- Automatically save the file when returning to Normal mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    -- Safety checks: Only save if the file was actually modified, 
    -- is a real file (not a terminal or plugin UI), and has a filename.
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! write")
    end
  end,
  desc = "Auto-save on InsertLeave",
})
