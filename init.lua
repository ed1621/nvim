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

-- Show all diagnostics on current line in floating window
vim.api.nvim_set_keymap(
  'n', '<leader>d', ':lua vim.diagnostic.open_float()<CR>', 
  { noremap = true, silent = true }
)
-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap(
  'n', '<leader>n', ':lua vim.diagnostic.goto_next()<CR>',
  { noremap = true, silent = true }
)
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap(
  'n', '<leader><leader>p', ':lua vim.diagnostic.goto_prev()<CR>',
  { noremap = true, silent = true }
)

