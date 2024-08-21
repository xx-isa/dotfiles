return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        local fzf = require("fzf-lua")
        fzf.setup({})

        local keymap = vim.keymap
        local opts = { noremap = true, silent = true }

        opts.desc = "Show files in FZF"
        keymap.set("n", "<leader>F", fzf.files, opts)
        opts.desc = "Resume FZF"
        keymap.set("n", "<leader>rF", fzf.resume, opts)
        opts.desc = "Show references in FZF"
        keymap.set("n", "<leader>rr", fzf.lsp_references, opts)
    end,
}
