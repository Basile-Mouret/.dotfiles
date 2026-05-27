return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  config = function()
    vim.g.opencode_opts = {}
    vim.o.autoread = true

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*opencode*",
      callback = function(event)
        vim.keymap.set("t", "<Esc><Esc>", [[<C-\\><C-n>]], {
          buffer = event.buf,
          desc = "Opencode terminal normal mode",
        })
      end,
    })

    vim.keymap.set({ "n", "x" }, "<leader>oa", function()
      require("opencode").ask("@this: ")
    end, { desc = "Ask opencode" })

    vim.keymap.set({ "n", "x" }, "<leader>oo", function()
      require("opencode").select()
    end, { desc = "Opencode actions" })

    vim.keymap.set({ "n", "t" }, "<leader>ot", function()
      require("opencode").toggle()
    end, { desc = "Toggle opencode" })

    vim.keymap.set({ "n", "x" }, "<leader>or", function()
      return require("opencode").operator("@this ")
    end, { desc = "Send range to opencode", expr = true })

    vim.keymap.set("n", "<leader>orr", function()
      return require("opencode").operator("@this ") .. "_"
    end, { desc = "Send line to opencode", expr = true })
  end,
}
