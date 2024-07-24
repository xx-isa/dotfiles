return {
    'nvim-treesitter/nvim-treesitter',
    event = "VeryLazy",
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "python", }
        })
    end
}
