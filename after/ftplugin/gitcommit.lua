local map = require('core.utils.init').general.map

vim.api.nvim_buf_set_option(0, 'textwidth', 72)

function _G.josh()
  print("Co-Authored-By: Josh Furman <joshua-furman@pluralsight.com")
end

function _G.mobProgramming()
  josh() 
end

map('n', '<leader>jf', 'v:josh()')
map('n', '<leader>mob', 'v:mobProgramming()')


