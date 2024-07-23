return {
    {
        'vim-airline/vim-airline',
        dependencies = { "edkolev/tmuxline.vim"},
        enabled = false,
        init = function()
            vim.cmd([[ let g:airline_theme="catppuccin" ]])
            vim.cmd([[ let g:airline#extensions#tabline#enabled=1 ]])
            vim.cmd([[ let g:airline#extensions#tabline#formatter='unique_tail' ]])
        end
    },
    {
        'itchyny/lightline.vim',
        dependencies = { "edkolev/tmuxline.vim"},
    },
    {
        "edkolev/tmuxline.vim",
        lazy = true,
        init = function ()
            vim.cmd([[ let g:tmuxline_separators = { 'left': '', 'left_alt': '', 'right': '', 'right_alt': ''} ]])
        end
    }
}

