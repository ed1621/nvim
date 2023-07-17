local map = require('core.utils.init').general.map
local writeToBuf = require('core.utils.init').general.writeToBuf

vim.api.nvim_buf_set_option(0, 'textwidth', 72)

function _G.preston()
  writeToBuf("Co-Authored-By: Preston Ruff <preston-ruff@pluralsight.com>")
end

function _G.zakk()
  writeToBuf("Co-Authored-By: Zakk Lambertsen <zakk-lambertsen@pluralsight.com>")
end

function _G.brian()
  writeToBuf("Co-Authored-By: Brian Mbogo <brian-mbogo@pluralsight.com>")
end

function _G.mobProgramming()
  preston()
  zakk()
  brian()
end

map('n', '<leader>pr', ':lua preston()<CR>')
map('n', '<leader>zl', ':lua zakk()<CR>')
map('n', '<leader>bm', ':lua brian()<CR>')
map('n', '<leader>mob', ':lua mobProgramming()<CR>')

