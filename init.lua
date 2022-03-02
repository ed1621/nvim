vim.g.mapleader = " "
vim.env.MYVIMRC = "$NVIM_HOME/init.lua"

require('plugins')
require('core.options')
require('core.autocmds')
require('core.mappings').global()

-- which theme do I like best?
-- neon // tested. I like it!
-- aurora // tested. I'm a big fan!
-- melange // tested. honestly, liked it a lot more than I thought I would 
vim.cmd [[colorscheme melange]]

vim.diagnostic.config({
  virtual_text = false,
})

