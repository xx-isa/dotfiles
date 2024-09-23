local M = {}

M.colorscheme = "catppuccin"

-- :h lspconfig-all
M.lsp_servers = {
	"lua_ls",
	-- "pyright",
    -- "dockerls",
    -- "bashls",
    -- "jdtls",
    -- "hls",
}

M.ts_parsers = {
    "python",
    "haskell",
    "java"
}

return M
