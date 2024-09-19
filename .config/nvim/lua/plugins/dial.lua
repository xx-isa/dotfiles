local function set_keymap(mode, action, type)
        local key = (action == "increment" and "a" or "x")
    local opts = { silent = true, desc = (type == "g" and "Additive " or "") .. action }
    local keymap = string.format("%s<C-%s>", type, key)

    vim.keymap.set(string.sub(mode, 1, 1), keymap, function()
        require("dial.map").manipulate(action, mode)
    end, opts)
end

return {
    "monaqa/dial.nvim",
    event = { "VeryLazy" },
    config = function()
        for _, a in pairs({ "increment", "decrement" }) do
            for _, m in pairs({ "normal", "visual" }) do
                set_keymap(m, a, "")
                set_keymap(m, a, "g")
            end
        end

        local augend = require("dial.augend")
        local default = {
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
        }

        require("dial.config").augends:register_group({ default = default })
    end,
}
