local dap = require('dap')

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
dap.defaults.fallback.terminal_win_cmd = '15split new'
