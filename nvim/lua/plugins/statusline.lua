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
    },
}

