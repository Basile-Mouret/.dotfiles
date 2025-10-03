-- ~/.config/nvim/init.lua

-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Load general Neovim options
require('config.options')

-- Load keymaps
require('config.keymaps')

--Lazy.nvim
require('config.lazy')

-- lsp
require('config.lsp')
