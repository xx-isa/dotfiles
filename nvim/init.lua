
vim.cmd([[
call plug#begin()
    Plug 'dracula/vim', { 'as': 'dracula-vim'}
    Plug 'xiyaowong/transparent.nvim'
    Plug 'EdenEast/nightfox.nvim'
    Plug 'catppuccin/vim', { 'as': 'catpuccin' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'easymotion/vim-easymotion'
    Plug '~/.fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'gelguy/wilder.nvim'
    Plug 'roxma/nvim-yarp',  { 'do': 'pip install -r requirements.txt' }
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'mrcjkb/rustaceanvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
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
    Plug 'nvim-tree/nvim-web-devicons'
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
table.insert(dash_config.section.buttons.val, 1, dash_config.button( "c", "  Config", ":edit ~/Downloads/dotfiles/nvim/init.lua <Enter>" ))
require("alpha").setup(dash_config.config)

-- MASON/LSPCONFIG
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local keymap= vim.keymap
local opts= {noremap = true, silent= true}

local fzf_lua = require("fzf-lua")
local on_attach = function (client, bufnr)
    opts.buffer = bufnr

    opts.desc = "Show code actions"
    keymap.set({"n", "v"}, "<leader>ca", fzf_lua.lsp_code_actions, opts)
    opts.desc = "List locations"
    keymap.set("n", "gA", fzf_lua.lsp_finder, opts)
    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float , opts)
    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", vim.diagnostic.goto_prev , opts)
    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", vim.diagnostic.goto_next , opts)
    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename , opts)
    opts.desc = "Show signature help"
    keymap.set( "n", "<leader>gh", vim.lsp.buf.signature_help, opts)
end

require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").lua_ls.setup({
    settings = {Lua = {diagnostics = {globals = { 'vim' }},},},
    capabilities = capabilities,
    on_attach = on_attach
})

require("lspconfig").pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- COMPLETIONS
local cmp = require("cmp")
cmp.setup({
    snippets = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources(
        {
            {name = 'nvim_lsp_signature_help'},
            {name = 'nvim_lsp'},
            {name = 'vsnip'},
        }, {
            {name = 'buffer'},
        }
    )
})

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

o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.number = true
o.cc= { 80, 100, 120 }
o.ignorecase=true
o.mouse='v'
o.mouse='a'
o.clipboard=o.clipboard + "unnamedplus"
o.encoding="utf-8"
o.foldmethod="indent"
o.foldtext=""
o.termguicolors=true

vim.g.airline= {
    extensions = {
        tabline = {
            enable=1,
            formatter='unique_tail',
        },
    },
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    callback = function ()
        vim.cmd([[ wincmd L ]])
    end
})

vim.cmd([[
colorscheme catppuccin_frappe

 " KEYBINDINGS
nnoremap <C-n> :NERDTreeToggle <Enter>
nnoremap <C-f> :NERDTreeFocus <Enter>
nnoremap <Leader>o :FzfLua files <Enter> 
nnoremap <Leader>f :Files 
nnoremap <Leader>b :FzfLua buffers <Enter>
nnoremap <Leader><C-l> :let @/ = "" <Enter>

]])

