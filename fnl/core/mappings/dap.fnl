(local utils (require :core.mappings.mapping-utils))

(utils.bulk-add-normal-mappings {
    "<leader>dc" ":lua require('dap').continue()<CR>"
    "<leader>dr" ":lua require('dap').repl.toggle()<CR>"
    "<leader>ds" ":lua require('dap.ui.widgets').sidebar(require('dap.ui.widgets').scopes).toggle()<CR>"
    "<leader>dK" ":lua require('dap.ui.widgets').hover()<CR>"
    "<leader>dt" ":lua require('dap').toggle_breakpoint()<CR>"
    "<leader>dso" ":lua require('dap').step_over()<CR>"
    "<leader>dsi" ":lua require('dap').step_into()<CR>"
    "<leader>dl" ":lua require('dap').run_last()<CR>"})

