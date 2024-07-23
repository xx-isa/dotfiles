vim.cmd([[
call plug#begin()
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'easymotion/vim-easymotion'
    Plug 'mrcjkb/rustaceanvim'
    Plug 'tpope/vim-surround'
call plug#end()
]])

vim.g.rustaceanvim = {
    tools = {
        float_win_config = {
            border = 'rounded'
        }
    }
}
