vim.opt.number = true
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.ai = true -- auto-indent
vim.opt.vb = true -- visual bell
vim.opt.number = true -- line numvbrs
vim.opt.encoding = 'utf-8'
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
vim.opt.wrap = false

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- be able to copy and paste to the clipboard from wsl
if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end
