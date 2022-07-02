(import-macros {: map!} :hibiscus.vim)

(local utils (require :core.mappings.mapping-utils))

(map! [i] :kj :<Esc>)

;; don't copy replaced text after pasting
(map! [v] :p "\"_dP")

;; copy to clipboard
(map! [v] :<leader>y "\"*y<cr>")
(map! [n] :<leader>y "V\"*y<cr>")

;; paste from clipboard
(map! [v] :<leader>p "\"*p<cr>")
(map! [n] :<leader>p "\"*p<cr>")

;; use ESC to turn of search highlighting
(map! [n] :<Esc> ":noh<cr>")

;; save mappings
(utils.bulk-add-normal-mappings {
  :<leader>ww ":w<cr>"
  :<leader>wa ":a<cr>"
  :<leader>wq ":w<cr>:bd<cr>"
  :<leader>qq ":q!<cr>"
  :<leader>qa ":qa!<cr>"
})

;; lsp mappings
(utils.bulk-add-normal-mappings {
  :gD ":lua vim.lsp.buf.declarations()<cr>"
  :gd ":lua vim.lsp.buf.definition()<cr>"
  :gi ":lua vim.lsp.buf.implementation()<cr>"
  :gr ":lua vim.lsp.buf.references()<cr>"
  :<leader>d ":lua vim.lsp.diagnostic.open_float()<cr>"
  :<leader><leader>n ":lua vim.lsp.diagnostic.goto_next()<cr>"
  :<leader><leader>p ":lua vim.lsp.diagnostic.goto_prev()<cr>"
})


;; packer mappings
(utils.bulk-add-normal-mappings {
  :<leader>pi ":PackerInstall<cr>"
  :<leader>pu ":PackerUpdate<cr>"
  :<leader>pc ":PackerCompile<cr>"
  :<leader>ps ":PackerSynce<cr>"
  :<leader>pcl ":PackerClean<cr>"
})
