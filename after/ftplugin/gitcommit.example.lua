local map = require('core.utils.init').general.map
local writeToBuf = require('core.utils.init').general.writeToBuf

vim.api.nvim_buf_set_option(0, 'textwidth', 72)

function _G.example()
  writeToBuf("Co-Authored-By: Someone else <someone@pluralsight.com>")
end


function _G.mobProgramming()
  example()
end

map('n', '<leader>ex', ':lua example()<CR>')
map('n', '<leader>mob', ':lua mobProgramming()<CR>')

