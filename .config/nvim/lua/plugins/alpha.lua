return {
    'goolord/alpha-nvim',
    config = function ()
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
        [[                     ⠀✦ﾟ⠀⠀  ⣀⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣀⡀⠀⠀ﾟ⠀. ⧫                    ]],
        [[                 .  ⠀ ⠀✦⠀⠐⡊⠉⠉⠉⠉⠉⠉⠉⠉⠍⠙⠛⠛⢿⣿⣿⣿⣿⣷⣦⣄⠀⭑¸ ﾟ  .               ]],
        [[            ✶    . ⨀⠀✦⠀⠀⠀¸⠀⭑⠀⠀.⠀⠀⠀⠀ ⠀。 ⠈⠻⣿⣿⣿⣿⣿⣷⣄。 ⧫  ✦   .          ]],
        [[         ⠈      ⧫   ⠀ﾟ⠀..⠀⠀⠀⠀⡀⠀⠀⠐⠀⭑⠀ ⠀   ⠈⠈⢿⣿⣿⣿⣿⣿⣷⢄ﾟ   .   .          ]],
        [[       ⭑   ﾟ ✦    ✦  ⠀ ⠀⠀⠀.✢⢸⣿⣄⣀⣀⡄⠀⠀⠀.  ⭓⠀ ⠈⢿⣿⣿⣿⣿⣿⣿⣦ ✶ .⨀ 。 ⠈    .   ]],
        [[     ⠈     .   ✧    .⠀¸⠀⠀.⠀⠀⢸⣿⣿⣿⠟⠀.⠀⠀⠀     .⠈⣿⣿⣿⣿⣿⣿⣿ ⭑ ✧   ﾟ  ✢       ]],
        [[     .  ⠈   ✢     ⧫ ⠀⠀⠀⠀.⠀ ⠀⣾⣿⣿⣷⣄⡀⠀⠈⠀⠀✢  .⠀ ⠀⣿⣿⣿⣿⣿⣿⣿ 。  . ⭑    ✦ . ✶ ]],
        [[  ⠈  。 ✶     ✢     .⠀⠀⠀⠀ ⠀⠀⣿⣿⣿⣿⣿⣿⣷⣦⡀.⠀  ✶⠀.⠀⣿⣿⣿⣿⣿⣿⣿   ⭑ ¸  ¸ ⠈   ¸   ]],
        [[         ⠈   ¸    ⭑ ⠀⠀⠀⭑⠀ ⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀.   ⠀⣼⣿⣿⣿⣿⣿⣿⡟ ﾟ  ¸    ✢        ]],
        [[      .   。   ⭓    ⠀.⠀⠀。⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡇     ⣩⣿⣿⣿⣿⣿⣿⡿⠁  ✦  ⠈            ]],
        [[             ✦    ﾟ   ⢄⠀ ⠀.⠀⣾⡟⢸⣿⣿⣿⣿⣿⣿⣿⣄  ⣐⣼⣿⣿⣿⣿⣿⣿⠟⠁. ⧫   ✦   .        ]],
        [[             ⧫  ✧    ✢⠈⠳⣤⣀⣀⣰⡿⣀⣿⢧⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⨀   。               ]],
        [[                  ✧ .⠀⧫⠀✧⠙⠿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋✢⠀⭓ﾟ                    ]],
        [[                    ⠀⠀⠀⭑⠀⠀⠀⠀⠈⠉⠙⠛⠛⠛⠛⠛⠛⠛⠛⠋⠉⠁⠀⠀ﾟ⠀  ✶                     ]],
        }
        dashboard.section.buttons.val = {
            dashboard.button( "c", "  Config", "<Cmd>FzfLua files cwd=~/.config/nvim <CR>" ),
            dashboard.button( "g", "  Neogit", "<Cmd>Neogit<CR>" ),
            dashboard.button( "e", "  New File", "<Cmd>ene<CR>"),
            dashboard.button( "o", "󰉋  Open File", "<Cmd>FzfLua files<CR>"),
        }
        dashboard.section.footer.val = "love u"
        require("alpha").setup(dashboard.config)
    end
}
