return {
    "itchyny/lightline.vim",
    dependencies = {
        "tpope/vim-fugitive",
    },
    init = function()
        local utils = require("utils")
        vim.g.lightline = {
            colorscheme = utils.colorscheme,
            active = {
                left = {
                    { "mode", "paste" }, { "gitbranch" }, { "readonly", "filename" }
                },
                right = {
                    { "lineinfo" },
                    { "percent" },
                    { "fileencoding", "filetype" },
                },
            },
            component_function = {
                filename = "LightlineFilename",
                gitbranch = "FugitiveHead",
                readonly = "LightlineReadonly",
            },
        }

        vim.cmd([[
        function! LightlineReadonly()
            return &readonly && &filetype !~# '\v(help)' ? 'RO' : ''
        endfunction

        function! LightlineFilename()
            let filename = expand('%:t') !=# '' ? expand('%:t') : '[NONAME]'
            let modified = &modified ? ' +' : ''
            return filename . modified
        endfunction
        ]])
    end,
}
