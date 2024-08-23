return {
    "monaqa/dial.nvim",
    event = { "VeryLazy" },
    config = function()
        local function set_keymap(mode, action, type)
            local opts = { silent = true }
            opts.desc = (type == "g" and "Additive " or "") .. action
            local key = (action == "increment" and "a" or "x")
            vim.keymap.set(
                string.sub(mode, 1, 1),
                string.format("%s<C-%s>", type, key),
                function ()
                    require("dial.map").manipulate(action, mode)
                end,
                opts
            )
        end

        for _, a in pairs({ "increment", "decrement" }) do
            for _, t in pairs({"", "g"}) do
                for _, m in pairs({"normal", "visual"}) do
                    set_keymap(m, a, t)
                end
            end
        end

        local augend = require("dial.augend")
        require("dial.config").augends:register_group({
            default = {
                augend.integer.alias.decimal_int,
                augend.integer.alias.hex,
                augend.integer.alias.binary,
                augend.date.alias["%H:%M"],
                augend.constant.alias.ja_weekday_full,
                augend.constant.alias.bool,
                augend.constant.new({
                    elements = { "&&", "||" },
                    word = false,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = { "and", "or" },
                    word = true,
                    cyclic = true,
                }),
                augend.case.new({
                    types = {
                        "camelCase",
                        "snake_case",
                        "SCREAMING_SNAKE_CASE",
                        "kebab-case",
                        "PascalCase",
                    },
                    cyclic = true,
                }),
            },
        })
    end,
}
