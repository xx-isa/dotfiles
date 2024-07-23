return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            {
                "williamboman/mason-lspconfig.nvim",
                dependencies = { "williamboman/mason.nvim" }
            },
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                }
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("lspconfig").lua_ls.setup({
                settings = {
                    Lua = { diagnostics = { globals = { 'vim', }, }, },
                },
                capabilities = capabilities
            })

            require("lspconfig").pyright.setup({
                capabilities = capabilities
            })

            local keymap= vim.keymap
            local opts= {noremap = true, silent= true}

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    opts.buffer = args.buf

                    opts.desc = "Show code actions"
                    keymap.set({"n", "v"}, "<leader>a", vim.lsp.buf.code_action, opts)
                    opts.desc = "Show line diagnostics"
                    keymap.set("n", "<leader>d", vim.diagnostic.open_float , opts)
                    opts.desc = "Smart rename"
                    keymap.set("n", "<leader>rn", vim.lsp.buf.rename , opts)
                    opts.desc = "Show signature help"
                    keymap.set( "n", "<leader>h", vim.lsp.buf.signature_help, opts)
                end
            })

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    update_in_insert = true
                }
            )

        end
    },
}
