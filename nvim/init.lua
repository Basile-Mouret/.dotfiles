-- ~/.config/nvim/init.lua

-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Load general Neovim options
require('config.options')

--Lazy.nvim
require('config.lazy')

-- Load keymaps
require('config.keymaps')

-- lsp
require('config.lsp')

