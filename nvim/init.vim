" VM-PLUG
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
call plug#end()

" MASON/LSP CONFIG

lua <<EOF
require("mason").setup()
require("mason-lspconfig").setup() 
require("lspconfig").lua_ls.setup({})
require("lspconfig").rust_analyzer.setup({
    on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end,
    ["rust-analyzer"] = {
        checkOnSave = {
            command = "clippy",
        },
    },
})

EOF

"
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

endfunction

" GENERAL CONFIG
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set cc=80,100,120
set ignorecase
set mouse=v
set mouse=a
set clipboard+=unnamedplus

colorscheme catppuccin_frappe

let g:vimsyn_embed='lPr'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'

" KEYBINDINGS
nnoremap <C-n> :NERDTreeToggle <Enter>
nnoremap <C-f> :NERDTreeFocus <Enter>
nnoremap <Leader>o :Files <Enter> 
nnoremap <Leader>f :Files 
nnoremap <Leader>b :Buffers <Enter>
