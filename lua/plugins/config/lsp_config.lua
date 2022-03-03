---@diagnostic disable-next-line: unused-local
local lspconfig = require('lspconfig')

local servers = {
    'sumneko_lua',
    'pyright',
    'clangd',
    'bashls',
    'dockerls',
    'jsonls',
    'sqls',
    'vimls',
    'yamlls',
    'hls',
    'elixirls'
}

---@diagnostic disable-next-line: unused-local
local function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

---@diagnostic disable-next-line: unused-local
    local opts = {noremap = true, silent = true}
end

-- lspInstall + lspconfig stuff
local lua_settings = {
    Lua = {
        runtime = {
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),    
        },
        diagnostics = {
            globals = {'vim', 'ok', 'nvim_lsp'},
            disable = { 'trailing-space'}
        },
        workspace = {
            library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
            },
            maxPreload = 100000,
            preloadFileSize = 10000
        },
        telemetry = {
            enable = false
        }
    }
}

-- local function make_config()
--     local capabilities = vim.lsp.protocol.make_client_capabilities()
--     capabilities.textDocument.completion.completionItem.snippetSupport = true
--     capabilities.textDocument.completion.completionItem.resolveSupper = {
--         properties = {
--             'documentation',
--             'detail',
--             'additionalTextEdits'
--         }
--     }
--     return {
--         capabilities = capabilities,
--         on_attach = on_attach,
--     }
-- end

local lsp_installer = require('nvim-lsp-installer')

local function setup_server(attach)
    lsp_installer.on_server_ready(function(server)
        local opts = {}
        opts.on_attach = attach

        if server.name == "sumneko_lua" then
            opts.settings = lua_settings
        elseif server.name == "hls" then
            opts.settings = {
              haskell = {
                hlintOn = true,
                formattingProvider = "ormolu"
              }
            }
            opts.filetypes = {"haskell", "lhaskell", "hs", "lhs"}
        elseif server.name == "bashls" then
            opts.filetypes = {"sh", "bash", "bats"}
        end

        server:setup(opts)
        vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

local function install_server(server)
  if ok then
  local okay, server_analyzer = servers.get_server(server)
    if okay then
      if not server_analyzer:is_installed() then
          lsp_installer.install(server)
      end
    end
  end
end


setup_server(on_attach)

for _, server in ipairs(servers) do 
    install_server(server)
end

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define('LspDiagnosticsSignError', {text = '', numhl = 'LspDiagnosticsDefaultError'})
vim.fn.sign_define('LspDiagnosticsSignWarning', {text = '', numhl = 'LspDiagnosticsDefaultWarning'})
vim.fn.sign_define('LspDiagnosticsSignInformation', {text = '', numhl = 'LspDiagnosticsDefaultInformation'})
vim.fn.sign_define('LspDiagnosticsSignHint', {text = '', numhl = 'LspDiagnosticsDefaultHint'})
