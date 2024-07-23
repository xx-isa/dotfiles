require("config.lazy")
vim.cmd([[ let g:lightline = { 'colorscheme': 'catppuccin' } ]])
vim.cmd.colorscheme("catppuccin")

local o = vim.opt

o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.number = true
o.cc= { 80, 100, 120 }
o.ignorecase=true
o.mouse='v'
o.mouse='a'
o.clipboard=o.clipboard + "unnamedplus"
o.encoding="utf-8"
o.termguicolors=true
o.signcolumn="yes:1"
o.statuscolumn="%C %l %s"

o.foldmethod="expr"
o.foldexpr="v:lua.vim.treesitter.foldexpr()"
o.foldtext=""
o.foldlevelstart=99
o.foldcolumn='1'
vim.cmd([[ highlight FoldColumn guibg=None ]])

vim.cmd.highlight("DiagnosticUnderlineWarn gui=undercurl")
vim.cmd.highlight("DiagnosticUnderlineError gui=undercurl")
vim.cmd.highlight("DiagnosticUnderlineInfo gui=undercurl")
vim.cmd.highlight("DiagnosticUnderlineOk gui=underdashed")
vim.cmd.highlight("DiagnosticUnderlineHint gui=underdashed")
