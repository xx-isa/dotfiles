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
        keymap.set("n", "Ff", fzf.files, opts)
        opts.desc = "Open config file (FZF)"
        keymap.set("n", "Fc", function() fzf.files({cwd = "~/.config/nvim"}) end, opts)
        opts.desc = "Live grep project FZF"
        keymap.set("n", "Fg", fzf.live_grep, opts)
        opts.desc = "Resume FZF"
        keymap.set("n", "Fr", fzf.resume, opts)
        opts.desc = "Complete path"
        keymap.set({ "n", "v", "i" }, "<C-\\>", fzf.complete_path, opts)

        vim.api.nvim_create_autocmd({"LspAttach"}, {
            callback = function ()
                opts.desc = "show references in fzf"
                keymap.set("n", "<leader>rr", fzf.lsp_references, opts)
            end
        })
    end,
}
