local packerUtils = require('core.utils.packerUtils')
local generalUtils = require('core.utils.general')

local M = {}

M.packer = {
  lazy_load = packerUtils.packer_lazy_load,
  bootstrap = packerUtils.bootstrap_packer
}

M.general = {
  map = generalUtils.map,
  writeToBuf = generalUtils.writeToBuffer
}

return M
