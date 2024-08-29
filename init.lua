
require("core.options")
require('core.mappings').global()

if vim.g.vscode then
--stuff
  require("config.lazy")
else
  vim.env.MYVIMRC = "$NVIM_HOME/init.lua"
  vim.opt.spellfile=vim.env.NVIM_HOME .. '/spell/en.utf-8.add'
  require("config.lazy")
end

