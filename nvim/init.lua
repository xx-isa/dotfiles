
vim.cmd([[
call plug#begin()
        Plug 'dracula/vim'
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
        Plug 'rafamadriz/friendly-snippets'
    call plug#end()
]])


-- MASON/LSPCONFIG
  -- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            -- completions = 
        }
    },
    capabilities = capabilities,
})


-- COMPLETIONS
local cmp = require"cmp"
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
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    
    sources = cmp.config.sources(
        {
            {name = 'nvim_lsp'},
            {name = 'vsnip'},
        }, {
            {name = 'buffer'},
        }
    )
})

vim.cmd([[
    " WILDER CONFIG
autocmd CmdlineEnter * ++once call s:wilder_init() | call wilder#main#start()

function! s:wilder_init() abort
    let s:scale = ["#6e40aa","#963db3","#bf3caf","#e4419d","#fe4b83",
                \  "#ff5e63","#ff7847","#fb9633","#e2b72f","#c6d63c","#aff05b"]
    let s:gradient = map(s:scale, {i, fg -> wilder#make_hl(
                \ 'WilderGradient' . i, 'Pmenu', [{}, {}, {'foreground': fg}]
                \ )})

    call wilder#setup({ 'modes': [':', '/', '?'] })

    call wilder#set_option('pipeline', [
                \   wilder#branch(
                \   wilder#cmdline_pipeline({
                \       'language': 'python',
                \       'fuzzy': 1,
                \     }),
                \     wilder#python_search_pipeline({
                \       'pattern': wilder#python_fuzzy_pattern(),
                \       'sorter': wilder#python_difflib_sorter(),
                \       'engine': 're',
                \     }),
                \   ),
                \ ])

    call wilder#set_option('renderer', wilder#popupmenu_renderer( 
        \ wilder#popupmenu_border_theme({ 
        \   'highlighter': wilder#highlighter_with_gradient([wilder#basic_highlighter(),]),
        \   'highlights': { 
        \       'border': 'Normal',
        \       'gradient': s:gradient,
        \   },
        \   'left': [ ' ', wilder#popupmenu_devicons(), ],
        \   'border': 'rounded',
        \   })))

end

]])


-- GENERAL CONFIG
local o = vim.opt

o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.number = true
o.cc= { 80,100,120 }
o.ignorecase=true
o.mouse='v'
o.mouse='a'
vim.cmd([[
 :set clipboard+=unnamedplus
 colorscheme catppuccin_frappe

 let g:airline#extensions#tabline#enabled=1
 let g:airline#extensions#tabline#formatter='unique_tail'
 " KEYBINDINGS
nnoremap <C-n> :NERDTreeToggle <Enter>
nnoremap <C-f> :NERDTreeFocus <Enter>
nnoremap <Leader>o :Files <Enter> 
nnoremap <Leader>f :Files 
nnoremap <Leader>b :Buffers <Enter>
]])
