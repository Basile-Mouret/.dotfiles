-- ~/.config/nvim/lua/config/keymaps.lua

-- Clipboard
vim.keymap.set({'n', 'x'}, 'gy', '"+y', {desc = 'Copy to clipboard'})
vim.keymap.set({'n', 'x'}, 'gp', '"+p', {desc = 'Paste clipboard text'})

-- General Shortcuts
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save file'})
vim.keymap.set('n', '<leader>q', '<cmd>quitall<cr>', {desc = 'Exit vim'})


-- Diagnostic
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- Go to the next diagnostic
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- Go to the previous diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })

vim.keymap.set('n', 'K', vim.lsp.buf.hover, { 
    buffer = bufnr, 
    desc = "LSP: Voir documentation" 
  })

  vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { 
    buffer = bufnr, 
    desc = "LSP: Actions de code (corrections)" 
  })
