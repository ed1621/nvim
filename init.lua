vim.g.mapleader = " "
vim.env.MYVIMRC = "$NVIM_HOME/init.lua"

vim.opt.number = true
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.ai = true -- auto-indent
vim.opt.vb = true -- visual bell
vim.opt.number = true -- line numvbrs
vim.opt.encoding = 'utf-8'
vim.opt.spellfile=vim.env.NVIM_HOME .. '/spell/en.utf-8.add'
vim.opt.tabstop = 2 -- spaces that <Tab> uses
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- spaces to indent
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hidden = true
vim.opt.syntax = "true"
vim.opt.autoread = true


require('plugins')
require('core.mappings').global()

vim.cmd [[colorscheme kat.nvim]]
