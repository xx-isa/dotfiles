return {
    "nvimtools/none-ls.nvim",
    lazy = true,
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.diagnostics.hadolint
            },
        })
    end,
}
