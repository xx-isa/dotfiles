require("config.lazy")

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

