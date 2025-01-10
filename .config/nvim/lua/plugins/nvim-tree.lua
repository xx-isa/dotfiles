return {
    "nvim-tree/nvim-tree.lua",
    keys = {
        { "<C-n>", "<Cmd>NvimTreeToggle<CR>", noremap = true, silent = true, desc = "Toggle NvimTree"}
    },
    cmd = {"NvimTreeOpen", "NvimTreeToggle"},
    init = function ()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    opts = {
        view = {
            width = 38,
            side = "right",
            signcolumn = "auto"
        },
    },
}
