local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "bashls",
    "dockerls",
    "jsonls",
    "marksman",
    "ruff", -- python
    "sqlls",
    "taplo",
    "terraformls",
    "yamlls"
  }
})
