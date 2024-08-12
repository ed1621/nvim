local map = require('core.utils.init').general.map
local writeToBuf = require('core.utils.init').general.writeToBuf

function _G.shebang() 
  writeToBuf("#!/bin/bash")
end

function _G.currentDir()
  writeToBuf('$( cd "$( dirname \"${BASH_SOURCE[0]}\" )" &> /dev/null && pwd )')
end

map('n', '<leader>sb', ':lua shebang()<CR>')
map('n', '<leader>cur', ':lua currentDir()<CR>')
