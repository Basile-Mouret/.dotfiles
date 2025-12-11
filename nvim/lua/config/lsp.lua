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

vim.lsp.config.julials = {
    cmd = {
        "julia",
        "--project=" .. vim.fn.expand("~") .. "/.julia/environments/lsp/",
        "--startup-file=no",
        "--history-file=no",
        "-e",
        [[
            using Pkg
            Pkg.instantiate()
            using LanguageServer
            depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
            project_path = let
                dirname(something(
                    ## 1. Finds an explicitly set project (JULIA_PROJECT)
                    Base.load_path_expand((
                        p = get(ENV, "JULIA_PROJECT", nothing);
                        p === nothing ? nothing : isempty(p) ? nothing : p
                    )),
                    ## 2. Look for a Project.toml file in the current working directory,
                    ##    or parent directories, with $HOME as an upper boundary
                    Base.current_project(),
                    ## 3. First entry in the load path
                    get(Base.load_path(), 1, nothing),
                    ## 4. Fallback to default global environment,
                    ##    this is more or less unreachable
                    Base.load_path_expand(" @v#.#"),
                ))
            end
            @info "Running language server" VERSION pwd() project_path depot_path
            server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
            server.runlinter = true
            run(server)
        ]]
    },
    filetypes = { 'julia' },
    root_dir = require('lspconfig').util.root_pattern("Project.toml", "JuliaProject.toml"),
    settings = {},
    on_attach = on_attach_general,
}

vim.lsp.config.tinymist = {
        on_attach = function(client, bufnr)

                vim.keymap.set("n", "<leader>tm", function()

                        client:exec_cmd({

                                title = "pin",

                                command = "tinymist.pinMain",

                                arguments = { vim.api.nvim_buf_get_name(0) },

                        }, { bufnr = bufnr })

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

local on_attach_ltex = function(client, bufnr)
  on_attach_general(client, bufnr)
  require('ltex_extra').setup({
    load_langs = { "fr", "en-US" }, -- Charge ces dictionnaires
    -- path = vim.fn.expand("~") .. "/.ltex" -- Où stocker les mots
  })
end
vim.lsp.config.ltex = {
  filetypes = { 
    "bib", 
    "gitcommit", 
    "latex", 
    "markdown", 
    "org", 
    "plaintex", 
    "rst", 
    "tex", 
    "typst" -- Ajout pour Typst
  },
  settings = {
    ltex = {
      language = "auto", 
      checkFrequency = "save",
      additionalRules = {
        enablePickyRules = true,
     -- motherTongue = "fr",
      },
    }
  },
  on_attach = on_attach_ltex,
}
