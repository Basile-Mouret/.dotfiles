-- ~/.config/nvim/lua/config/lsp.lua

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
})

local on_attach_general = function(client, bufnr)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Voir documentation" })
  vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP: Actions de code (corrections)" })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP: Aller à la définition" })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = "LSP: Voir les références" })
end

vim.lsp.config("jetls", {
    cmd = {
        "jetls",
        "--threads=auto",
        "--",
    },
    filetypes = { "julia" },
    root_markers = { "Project.toml" }
})
vim.lsp.enable("jetls")

vim.lsp.config.tinymist = {
    on_attach = function(client, bufnr)
        vim.keymap.set("n", "<leader>tm", function()
            client:exec_cmd({title = "pin",command = "tinymist.pinMain",arguments = { vim.api.nvim_buf_get_name(0) },}, { bufnr = bufnr })
        end, { desc = "[T]inymist pin [M]ain", noremap = true })
        vim.keymap.set("n", "<leader>tu", function()
            client:exec_cmd({
                title = "unpin",
                command = "tinymist.pinMain",
                arguments = { vim.v.null },
            }, { bufnr = bufnr })
        end, { desc = "[T]inymist [U]npin main", noremap = true })
    end,
}

lspconfig.harper_ls.setup({
  -- Harper supports markdown, tex, and typst out of the box
  filetypes = { 
    "markdown", 
    "tex", 
    "bib", 
    "typst", 
    "gitcommit" 
    -- Note: 'latex' and 'plaintex' are usually covered by 'tex', 
    -- but you can add them if your autocommands use those specific ft names.
  },
  
  settings = {
    ["harper-ls"] = {
      -- This allows you to use 'zg' to add words to the dictionary 
      -- and have Harper stop flagging them immediately.
      userDictPath = vim.fn.stdpath("config") .. "/spell/en.utf-8.add",
      
      -- Optional: Adjust specific settings if needed
      linters = {
        spell_check = true,
        spelled_numbers = false, -- e.g., allows "3" instead of "three"
        an_a = true,             -- Checks "a" vs "an"
      }
    }
  },

  on_attach = function(client, bufnr)
    -- We keep your general settings
    if on_attach_general then
      on_attach_general(client, bufnr)
    end
    
    -- NOTE: 'ltex_extra' is NOT compatible with Harper, so we removed it.
  end,
})
