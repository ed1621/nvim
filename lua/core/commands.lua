local utils = require('core.utils.init')


vim.api.nvim_add_user_command(
  'RemoveHarpoonMark',
  function (opts)
    utils.harpoon.removeHarpoonMark(opts.args)
  end,
  { nargs = 1 }
)

vim.api.nvim_add_user_command(
  'ConvertStageToProd',
  function ()
    utils.converters.stageToProd()
  end, {}
)

vim.api.nvim_add_user_command(
  'ConvertProdToStage',
  function ()
    utils.converters.prodToStage()
  end, {}
)
