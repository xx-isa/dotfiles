return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            {
                "williamboman/mason-lspconfig.nvim",
                dependencies = { "williamboman/mason.nvim" },
            },
            "nvimtools/none-ls.nvim",
        },
        config = function()
            local utils = require("utils")
            local mason_lspconfig = require("mason-lspconfig")
            local lspconfig = require("lspconfig")
            require("mason").setup()
            mason_lspconfig.setup({
                ensure_installed = utils.lsp_servers,
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = { globals = { "vim" } },
                            },
                        },
                        capabilities = capabilities,
                        })
                end,
                ["bashls"] = function ()
                    lspconfig.bashls.setup({
                        filetypes = {"sh", "zsh"},
                        capabilities = capabilities
                    })
                end
            })

            local keymap = vim.keymap
            local opts = { noremap = true, silent = true }

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    opts.buffer = args.buf

                    opts.desc = "Show code actions ~/"
                    keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
                    keymap.set({ "i" }, "<C-\\>a", vim.lsp.buf.code_action, opts)
                    opts.desc = "Show line diagnostics"
                    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
                    opts.desc = "Smart rename"
                    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    opts.desc = "Show signature help"
                    keymap.set("n", "<leader>h", vim.lsp.buf.signature_help, opts)
                    opts.desc = "Format code"
                    keymap.set({ "n", "v" }, "<leader>fmt", vim.lsp.buf.format, opts)
                end,
            })

            vim.lsp.handlers["textDocument/publishDiagnostics"] =
                vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                    update_in_insert = true,
                })
        end,
    },
}
