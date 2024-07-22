require("config.lazy")

vim.cmd([[
call plug#begin()
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'dracula/vim', { 'as': 'dracula-vim'}
    Plug 'EdenEast/nightfox.nvim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'easymotion/vim-easymotion'
    Plug '~/.fzf'
    Plug 'gelguy/wilder.nvim'
    Plug 'roxma/nvim-yarp',  { 'do': 'pip install -r requirements.txt' }
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'mrcjkb/rustaceanvim'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'preservim/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'm4xshen/autoclose.nvim'
    Plug 'goolord/alpha-nvim'
    Plug 'chrisbra/unicode.vim'
    Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
    Plug 'edkolev/tmuxline.vim'
    Plug 'stevearc/dressing.nvim'
call plug#end()
]])

-- PLUGINS SETUP
require("ibl").setup()
require("autoclose").setup()
-- START SCREEN

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

-- WILDER CONFIG

local wilder = require("wilder")

local gradient = { "#6e40aa","#963db3","#bf3caf","#e4419d","#fe4b83",
         "#ff5e63","#ff7847","#fb9633","#e2b72f","#c6d63c","#aff05b" }

for i, fg in ipairs(gradient) do
    gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', { { a=1 }, {a=1}, {foreground = fg} })
end

wilder.setup({
    modes = {':', '/', '?'}
})

wilder.set_option('pipeline', {
    wilder.branch(
        wilder.cmdline_pipeline({
            language = 'python',
            fuzzy = '1',
        }),
        wilder.python_search_pipeline({
            pattern = wilder.python_fuzzy_pattern(),
            sorter = wilder.python_difflib_sorter(),
            engine = 're',
        })
    ),
})

wilder.set_option('renderer', wilder.popupmenu_renderer({
    highlights = {
        border = 'Normal',
        gradient = gradient,
    },
    highlighter = {
        wilder.highlighter_with_gradient({
            wilder.basic_highlighter(),
        })
    },
    left = { ' ', wilder.popupmenu_devicons(), },
    border = 'rounded',
}))

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
let g:airline_theme='catppuccin'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter= 'unique_tail'
let g:tmuxline_separators = { 'left': '', 'left_alt': '', 'right': '', 'right_alt': ''}
 " KEYBINDINGS
nnoremap <C-n> :NERDTreeToggle <Enter>
nnoremap <C-f> :NERDTreeFocus <Enter>
nnoremap <Leader>o :FzfLua files <Enter>
nnoremap <Leader>f :FzfLua files cwd=
nnoremap <Leader>b :FzfLua buffers <Enter>
nnoremap <Leader><C-l> :let @/ = "" <Enter>

]])

