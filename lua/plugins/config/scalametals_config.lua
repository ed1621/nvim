vim.opt_global.shortmess:remove("F"):append("c")
----------------------------------
-- Setup -------------------------
----------------------------------
-- Metals settings
local metals_config = require('metals').bare_config()

metals_config.settings = {
  showImplicitArguments = true,
  showInferredType = true,
  showImplicitConversionsAndClasses = true,
  excludedPackages = { 'akka.actor.typed.javadsl', 'com.github.swagger.akka.javadsl' },
  scalafmtConfigPath = '.scalafmt.conf'
}

metals_config.init_options.statusBarProvider = 'on'
-- metals_config.init_options.disableColorOutput = false

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
metals_config.capabilities = capabilities

vim.api.nvim_set_var('metalsConfig', metals_config)

-- DAP settings
local dap = require('dap')
dap.configurations.scala = {
  {
    type = 'scala',
    request = 'launch',
    name = 'Run',
    metals = {
      runType = 'run'
    }
  },
  {
    type = 'scala',
    request = 'launch',
    name = 'Test File',
    metals = {
      runType = 'testFile'
    }
  },
  {
    type = 'scala',
    request = 'launch',
    name = 'Test Target',
    metals = {
      runType = 'testTarget'
    }
  },
}

metals_config.on_attach = function(client, bufnr)
  require('metals').setup_dap()
end

----------------------------------
-- COMMANDS ----------------------
----------------------------------
-- LSP
vim.cmd[[augroup lsp]]
vim.cmd[[au!]]
vim.cmd[[au FileType scala,sbt,sc setlocal omnifunc=v:lua.vim.lsp.omnifunc]]
vim.cmd[[au FileType scala,sbt,sc lua require('metals').initialize_or_attach(metals_config)]]
vim.cmd[[augroup end]]

-- Need for symbol highlights to work correctly
vim.cmd [[hi! link LspReferenceText CursorColumn]]
vim.cmd [[hi! link LspReferenceRead CursorColumn]]
vim.cmd [[hi! link LspReferenceWrite CursorColumn]]
