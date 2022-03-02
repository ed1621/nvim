local M = {}

M.stageToProd = function ()
  vim.cmd('%s/is-/ip-/g')
  vim.cmd('%s/staging/production/g')
  vim.cmd('%s/-stage//g')
end

M.prodToStage = function ()
  vim.cmd('%s/ip-/is-/g')
  vim.cmd('%s/production/staging/g')
  vim.cmd('%s/registry/registry-stage/g')
end

return M



