(let [lsp-installer (require :nvim-lsp-installer)]
  lsp-installer.setup {
          :ensure_installed [:sumneko_lua
                             :pyright
                             :clangd
                             :bashls
                             :dockerls
                             :jsonls
                             :sqls
                             :vimls
                             :yamlls
                             :hls
                             :elixirls]
          :automatic_installation true})

(let [lspconfig (require :lspconfig)]
  (fn on_attach [client bufnr] 
    (vim.api.nvim_buf_set_option bufnr "omnifunc" "v:lua.vim.lsp.omnifunc"))
  (lspconfig.sumneko_lua.setup 
    {:on_attach on_attach
     :settings 
      {:Lua 
        {
          :runtime {:version :LuaJIT :path (vim.split package.path ";")}
          :diagnostics {:globals ["vim" "ok" "nvim_lsp"] :disable ["trailing-space"]}
          :workspace {
            :library {
              (vim.fn.expand "$VIMRUNTIME/lua") true
              (vim.fn.expand "$VIMRUNTIME/lua/vim/lsp") true}
            :maxPreload 100000
            :preloadFileSize 10000}
          :telemetry {:enable false}}}})
  (lspconfig.pyright.setup {:on_attach on_attach})
  (lspconfig.clangd.setup {:on_attach on_attach})
  (lspconfig.bashls.setup {:on_attach on_attach
                           :filetypes ["sh" "bash" "bats"]})
  (lspconfig.dockerls.setup {:on_attach on_attach})
  (lspconfig.jsonls.setup {:on_attach on_attach})
  (lspconfig.sqls.setup {:on_attach on_attach})
  (lspconfig.vimls.setup {:on_attach on_attach})
  (lspconfig.yamlls.setup {:on_attach on_attach})
  (lspconfig.hls.setup {:on_attach on_attach
                        :settings {:haskell {:hlintOn true :formattingProvider "ormolu"}}
                        :filetypes ["haskell" "lhaskell" "hs" "lhs"]})
  (lspconfig.elixirls.setup {:on_attach on_attach}))


(vim.fn.sign_define :LspDiagnosticsSignError {:text "" :numhl :LspDiagnosticsDefaultError})
(vim.fn.sign_define :LspDiagnosticsSignWarning {:text "" :numhl :LspDiagnosticsDefaultWarning})
(vim.fn.sign_define :LspDiagnosticsSignInformation {:text "" :numhl :LspDiagnosticsDefaultInformation})
(vim.fn.sign_define :LspDiagnosticsSignHint {:text "" :numhl :LspDiagnosticsDefaultHint})
