local M = {}

M.removeHarpoonMark = function (markId)
  require('harpoon.mark').rm_file(markId)
end

return M
