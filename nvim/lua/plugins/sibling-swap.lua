return {
    "Wansmer/sibling-swap.nvim",
    dependencies = { "nvim-treesitter" },
    opts = {
        keymaps = {
            ["<leader>."] = "swap_with_right",
            ["<leader>,"] = "swap_with_left",
        }
    },
}
