local map = require('core.utils.init').general.map
local writeToBuf = require('core.utils.init').general.writeToBuf

vim.api.nvim_buf_set_option(0, 'textwidth', 72)

function _G.josh()
  writeToBuf("Co-Authored-By: Josh Furman <joshua-furman@pluralsight.com>")
end

function _G.mobProgramming()
  josh() 
end

map('n', '<leader>jf', ':lua josh()<CR>')
map('n', '<leader>mob', ':lua mobProgramming()<CR>')

