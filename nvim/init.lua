require("config.lazy")
-- COLORSCHEME

vim.g.lightline = { colorscheme = "catppuccin" }
vim.cmd.colorscheme("catppuccin")

-- GENERAL CONFIGS
local o = vim.opt

o.pumheight = 10
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.number = true
o.relativenumber = true
o.cc = { 80, 100, 120 }
o.ignorecase = true
o.mouse = "v"
o.mouse = "a"
o.clipboard = o.clipboard + "unnamedplus"
o.encoding = "utf-8"
o.termguicolors = true
o.signcolumn = "yes:1"
o.statuscolumn = "%C %l %s"
-- o.statuscolumn = "%l %s"
o.showmode = false

o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldtext = ""
o.foldlevelstart = 99
o.foldcolumn = "1"
vim.cmd([[ highlight FoldColumn guibg=None ]])

-- SQUIGGLY LINES
vim.cmd([[ highlight DiagnosticUnderlineWarn gui=undercurl ]])
vim.cmd([[ highlight DiagnosticUnderlineError gui=undercurl ]])
vim.cmd([[ highlight DiagnosticUnderlineInfo gui=undercurl ]])
vim.cmd([[ highlight DiagnosticUnderlineOk gui=underdashed ]])
vim.cmd([[ highlight DiagnosticUnderlineHint gui=underdashed ]])

-- KEYMAPS
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

opts.desc = "Clear search results"
keymap.set("n", "<leader><C-l>", [[ <Cmd>let @/=""<CR> ]], opts)
opts.desc = "Toggle scrollbind"
keymap.set("n", "<leader>scb", [[ <Cmd>windo set scrollbind!<CR> ]], opts)

-- TOGGLE RELATIVE LINE NUMBER
vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    callback = function(ev)
        if ev.event == "InsertEnter" then
            o.relativenumber = false
            return
        end
        o.relativenumber = true
    end,
})
