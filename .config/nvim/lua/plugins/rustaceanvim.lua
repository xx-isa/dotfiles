return {
    "mrcjkb/rustaceanvim",
    enabled = false,
    init = function()
        vim.g.rustaceanvim = {
            tools = {
                float_win_config = {
                    border = "rounded",
                },
            },
        }
    end,
}
