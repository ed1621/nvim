(import-macros {: map! : ->str} :macros)

(fn bulk-add-normal-mappings [commands]
  (each [mapping commands (pairs commands)]
    (map! [n] mapping commands {:noremap true :silent true})))

;; escape
(map! [i] "kj" "<esc>:w<cr>")
;; don't copy replaced text after pasting
(map! [v] "p" "\"_dP") 
;; copy selected to clipboard
(map! [v] "<leader>y" "\"*y<cr>")
;; paste from clipboard
(map! [v] "<leader>p" "\"*p<cr>")
;; use esc to turn off search highlighting
(map! [n] "<esc" ":noh<cr>")

;; SAVE MAPPINGS
(bulk-add-normal-mappings {:<leader>ww ":w<cr>"
                           :<leader>wa ":wa<cr>"
                           :<leader>wq ":wq<cr>"
                           :<leader>qq ":q!<cr>"
                           :<leader>qa ":qa!<cr>"})
                         
;; BUFFER MOVEMENT MAPPINGS
(bulk-add-normal-mappings {:bn ":bn<cr>"
                           :bp ":bp<cr>"
                           :bd ":bd!<cr>"})

;; LSP MAPPINGS
(bulk-add-normal-mappings {:gD vim.lsp.buf.declaration
                           :gd vim.lsp.buf.definition
                           :<leader>gi vim.lsp.buf.implementation
                           :gr vim.lsp.buf.references
                           :<leader>d vim.diagnostic.open_float
                           :<leader><leader>n vim.diagnostic.goto_next
                           :<leader><leader>p vim.diagnostic.goto_prev})

;; PACKER MAPPINGS
(bulk-add-normal-mappings {:<leader>pi ":PackerInstall<cr>"
                           :<leader>pu ":PackerUpdate<cr>"
                           :<leader>pc ":PackerCompile<cr>"
                           :<leader>ps ":PackerSync<cr>"
                           :<leader>pcl ":PackerClean<cr>"})
