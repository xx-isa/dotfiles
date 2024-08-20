return {
    "hrsh7th/nvim-cmp",
    event = {"InsertEnter", "CmdlineEnter"},
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "chrisgrieser/cmp-nerdfont",
        "onsails/lspkind.nvim",
        'hrsh7th/cmp-nvim-lsp-signature-help',
        {
            'hrsh7th/cmp-vsnip',
            dependencies = {
                'hrsh7th/vim-vsnip',
                dependencies = {"rafamadriz/friendly-snippets"}
            }
        }
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup {
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                    --require("luasnip").lsp_expand(args.body)
                end
            },

            mapping = cmp.mapping.preset.insert({
              ["<C-b>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<C-e>"] = cmp.mapping.abort(),
              ["<CR>"] = cmp.mapping.confirm({ select = false }),
              -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),

            formatting = {
                format = function (entry, vim_item)
                    if vim.tbl_contains({"path"}, entry.source.name) then
                        local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
                        if icon then
                            vim_item.kind = icon
                            vim_item.kind_hl_group = hl_group
                            return vim_item
                        end
                    end
                    return require("lspkind").cmp_format({
                        mode = 'symbol_text',
                    })(entry, vim_item)
                end
            },

            sources = cmp.config.sources(
                {
                    {name = "nvim_lsp_signature_help"},
                    {name = "nvim_lsp"},
                    {name = "vsnip"},
                    {name = "nerdfont"}
                },
                {
                    {name = "buffer"},
                }
            ),
        }

        cmp.setup.cmdline({'/', '?'}, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                {name = "buffer"}
            },
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                {name = 'path'}
            }, {
                {name = 'cmdline'}
            }),
            matching = { disallow_symbol_nonprefix_matching = false}
        })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    cmp.event:on (
        "confirm_done",
        cmp_autopairs.on_confirm_done()
    )

    end
}

