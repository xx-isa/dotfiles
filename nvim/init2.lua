vim.cmd([[
call plug#begin()
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdtree'
    Plug 'easymotion/vim-easymotion'
    Plug '~/.fzf'
    Plug 'mrcjkb/rustaceanvim'
    Plug 'preservim/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'goolord/alpha-nvim'
    Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
call plug#end()
]])

local dash_config = require("alpha.themes.dashboard")
dash_config.section.header.val = {
    [[                     ⠀✦ﾟ⠀⠀  ⣀⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣀⡀⠀⠀ﾟ⠀. ⧫                         ]],
    [[                 .  ⠀ ⠀✦⠀⠐⡊⠉⠉⠉⠉⠉⠉⠉⠉⠍⠙⠛⠛⢿⣿⣿⣿⣿⣷⣦⣄⠀⭑¸ ﾟ  .                    ]],
    [[            ✶    . ⨀⠀✦⠀⠀⠀¸⠀⭑⠀⠀.⠀⠀⠀⠀ ⠀。 ⠈⠻⣿⣿⣿⣿⣿⣷⣄。 ⧫  ✦   .               ]],
    [[         ⠈      ⧫   ⠀ﾟ⠀..⠀⠀⠀⠀⡀⠀⠀⠐⠀⭑⠀ ⠀   ⠈⠈⢿⣿⣿⣿⣿⣿⣷⢄ﾟ   .   .               ]],
    [[       ⭑   ﾟ ✦    ✦  ⠀ ⠀⠀⠀.✢⢸⣿⣄⣀⣀⡄⠀⠀⠀.  ⭓⠀ ⠈⢿⣿⣿⣿⣿⣿⣿⣦ ✶ .⨀ 。 ⠈    .        ]],
    [[     ⠈     .   ✧    .⠀¸⠀⠀.⠀⠀⢸⣿⣿⣿⠟⠀.⠀⠀⠀     .⠈⣿⣿⣿⣿⣿⣿⣿ ⭑ ✧   ﾟ  ✢            ]],
    [[     .  ⠈   ✢     ⧫ ⠀⠀⠀⠀.⠀ ⠀⣾⣿⣿⣷⣄⡀⠀⠈⠀⠀✢  .⠀ ⠀⣿⣿⣿⣿⣿⣿⣿ 。  . ⭑    ✦ . ✶      ]],
    [[  ⠈  。 ✶     ✢     .⠀⠀⠀⠀ ⠀⠀⣿⣿⣿⣿⣿⣿⣷⣦⡀.⠀  ✶⠀.⠀⣿⣿⣿⣿⣿⣿⣿   ⭑ ¸  ¸ ⠈   ¸        ]],
    [[         ⠈   ¸    ⭑ ⠀⠀⠀⭑⠀ ⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀.   ⠀⣼⣿⣿⣿⣿⣿⣿⡟ ﾟ  ¸    ✢             ]],
    [[      .   。   ⭓    ⠀.⠀⠀。⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡇     ⣩⣿⣿⣿⣿⣿⣿⡿⠁  ✦  ⠈                 ]],
    [[             ✦    ﾟ   ⢄⠀ ⠀.⠀⣾⡟⢸⣿⣿⣿⣿⣿⣿⣿⣄  ⣐⣼⣿⣿⣿⣿⣿⣿⠟⠁. ⧫   ✦   .             ]],
    [[             ⧫  ✧    ✢⠈⠳⣤⣀⣀⣰⡿⣀⣿⢧⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⨀   。                    ]],
    [[                  ✧ .⠀⧫⠀✧⠙⠿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋✢⠀⭓ﾟ                         ]],
    [[                    ⠀⠀⠀⭑⠀⠀⠀⠀⠈⠉⠙⠛⠛⠛⠛⠛⠛⠛⠛⠋⠉⠁⠀⠀ﾟ⠀  ✶                          ]],
}
table.insert(dash_config.section.buttons.val, 1, dash_config.button( "c", "  Config", ":edit ~/.config/nvim/init.lua <Enter>" ))
require("alpha").setup(dash_config.config)

vim.g.rustaceanvim = {
    tools = {
        float_win_config = {
            border = 'rounded'
        }
    }
}

-- GENERAL CONFIG
local o = vim.opt

vim.cmd([[
    let g:NERDTreeWinSize=38
    let g:NERDTreeWinPos='right'
]])

vim.api.nvim_create_autocmd("FileType", {
    pattern = "nerdtree",
    callback = function ()
        o.cc={}
        o.statuscolumn=""
    end
})

vim.cmd([[

 " KEYBINDINGS
nnoremap <C-n> :NERDTreeToggle <Enter>
nnoremap <C-f> :NERDTreeFocus <Enter>
nnoremap <Leader>o :FzfLua files <Enter>
nnoremap <Leader>f :FzfLua files cwd=
nnoremap <Leader>b :FzfLua buffers <Enter>
nnoremap <Leader><C-l> :let @/ = "" <Enter>

]])

