opts = {
    flavour="frappe",
    transparent_background=true,
    custom_highlights=function (colors)
       return {
           NormalFloat={ bg=colors.surface0},
           FloatBorder={ bg=colors.surface0},
           CursorLine={ bg=colors.surface0},
           Pmenu={ bg=colors.surface0},
       }
    end
}
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = opts
}
