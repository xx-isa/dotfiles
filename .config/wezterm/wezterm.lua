local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Frappe"
-- config.window_background_opacity = 0.9

config.font = wezterm.font("VictorMono Nerd Font", {
    weight = "Medium",
})
config.font_size = 13

config.window_decorations = "RESIZE"

config.enable_tab_bar = false

return config
