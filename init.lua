vim.env.MYVIMRC = "$NVIM_HOME/init.lua"

require("core.options")
require("config.lazy")
require('core.mappings').global()

