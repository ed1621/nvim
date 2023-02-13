local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = {
    "sumneko_lua",
    "bashls",
    "dockerls",
    "jsonls",
    "marksman",
    "ruff_lsp", -- python
    "sqlls",
    "taplo",
    "terraformls",
    "yamlls"
  }
})
