local saga = require 'lspsaga'
saga.init_lsp_saga {
    -- your configuration 
    error_sign = '🚨',
    warn_sign = '⚠️',
    hint_sign = '💡',
    infor_sign = 'ℹ️',
    code_action_prompt = {
        enable = false --to turn off light bulb
    },
}
