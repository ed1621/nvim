local harpoonUtils = require('core.utils.harpoonUtils')
local conversionUtils = require('core.utils.conversionUtils')
local generalUtils = require('core.utils.general')
local packerUtils = require('core.utils.packerUtils')

local M = {}

M.packer = {
  lazy_load = packerUtils.packer_lazy_load,
  bootstrap = packerUtils.bootstrap_packer
}

M.harpoon = {
  removeHarpoonMark = harpoonUtils.removeHarpoonMark
}

M.converters = {
  vault = {
    stageToProd = conversionUtils.stageToProd,
    prodToStage = conversionUtils.prodToStage
  }
}

M.general = {
  map = generalUtils.map
}

return M
