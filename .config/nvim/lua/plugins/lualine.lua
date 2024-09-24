local lualine = {
    "nvim-lualine/lualine.nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons", opt = true }, "arkav/lualine-lsp-progress" },
    opts = {
        options = {
            component_separators = { left = "|", right = "|" },
            section_separators = { left = "", right = " " },
            globalstatus = true,
        },
        extensions = { "fzf", "lazy", "man", "mason" },
        sections = {
            lualine_c = { { "filename", path = 1, symbols = { modified = "+", readonly = "-" } }, "lsp_progress" },
            lualine_x = { "searchcount", "filetype" },
        },
        tabline = {
            lualine_a = { "tabs" },
            lualine_c = { { "filename", file_status = false } },
            lualine_x = { "encoding", "fileformat" },
            lualine_z = { { "buffers", hide_filename_extension = true, mode = 4, symbols = { alternate_file = "# " } } },
        },
    },
}

return lualine
