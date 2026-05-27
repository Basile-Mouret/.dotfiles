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

-- ==========================================
-- Visual Mode: Keep Selection Enhancements
-- ==========================================

-- 1. Indentation: Indent and immediately reselect
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and keep selection' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and keep selection' })

-- 2. Comments: Toggle comment and immediately reselect
-- (This uses Neovim 0.10+ default 'gc' comment behavior)
vim.keymap.set('v', '#', 'gcgv', { remap = true, desc = 'Toggle comment and keep selection' })

-- 3. Auto-Surround: Wrap text and immediately reselect
-- We use 'remap = true' to trigger mini.surround's 'sa' command.
local surround_pairs = {
  ['"'] = '"',
  ["'"] = "'",
  ['$'] = '$', -- Included for your Typst blocks!
  
  -- Because we inverted your brackets earlier, we must send the 
  -- closing bracket to mini.surround to ensure a tight wrap without spaces.
  ['('] = ')', 
  ['{'] = '}',
  ['['] = ']',
  ['<'] = '>',
}

for key, surround_char in pairs(surround_pairs) do
  vim.keymap.set('v', key, 'sa' .. surround_char .. 'gv', { 
    remap = true, 
    desc = 'Surround with ' .. key .. ' and keep selection' 
  })
end

-- ==========================================
-- Tab Indentation (Modern Editor Style)
-- ==========================================

-- Visual Mode: Indent multiple lines and keep the selection highlighted
vim.keymap.set('v', '<Tab>', '>gv', { desc = 'Indent selection' })
vim.keymap.set('v', '<S-Tab>', '<gv', { desc = 'Outdent selection' })
