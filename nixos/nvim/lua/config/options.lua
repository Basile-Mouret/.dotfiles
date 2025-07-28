-- ~/.config/nvim/lua/config/options.lua
vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.opt.softtabstop = 2
vim.o.wrap = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.signcolumn = 'yes'
vim.o.undofile = true -- Persistent undo
vim.o.updatetime = 300 -- Faster completion and LSP updates
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true -- Enable true colors

-- Transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })

