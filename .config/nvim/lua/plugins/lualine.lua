local lualine = {
    "nvim-lualine/lualine.nvim",
    dependencies = { "arkav/lualine-lsp-progress" },
    opts = function(_, opts)
        local trouble = require("trouble")
        local symbols = trouble.statusline({
            mode = "lsp_document_symbols",
            groups = {},
            title = false,
            filter = { range = true },
            format = "{kind_icon}{symbol.name:Normal} >",
            -- The following line is needed to fix the background color
            -- Set it to the lualine section you want to use
            hl_group = "lualine_c_normal",
        })
        return {
            options = {
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = " " },
                globalstatus = true,
            },
            extensions = { "fzf", "lazy", "man", "mason", "trouble" },
            sections = {
                lualine_c = { { "filename", path = 1, symbols = { modified = "+", readonly = "-" } }, "lsp_progress" },
                lualine_x = { "searchcount", "filetype" },
            },
            tabline = {
                lualine_a = { "tabs" },
                lualine_c = { { "filename", file_status = false } },
                lualine_x = { "encoding", "fileformat" },
                lualine_z = {
                    { "buffers", hide_filename_extension = true, mode = 4, symbols = { alternate_file = "# " } },
                },
            },
            winbar = {
                lualine_c = { { symbols.get, cond = symbols.has } },
            },
        }
    end,
}

return lualine
