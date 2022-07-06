(local utils (require :core.mappings.mapping-utils))

(utils.bulk-add-normal-mappings {
    ;; Move to previous/next
    "<A-,>" ":BufferPrevious<CR>"
    "<A-.>" ":BufferNext<CR>"

    ;; Re-order to previous/next
    "<A-<>" ":BufferMovePrevious<CR>"
    "<A->>" " :BufferMoveNext<CR>"

    ;; Goto buffer in position...
    "<A-1>" ":BufferGoto 1<CR>"
    "<A-2>" ":BufferGoto 2<CR>"
    "<A-3>" ":BufferGoto 3<CR>"
    "<A-4>" ":BufferGoto 4<CR>"
    "<A-5>" ":BufferGoto 5<CR>"
    "<A-6>" ":BufferGoto 6<CR>"
    "<A-7>" ":BufferGoto 7<CR>"
    "<A-8>" ":BufferGoto 8<CR>"
    "<A-9>" ":BufferGoto 9<CR>"
    "<A-0>" ":BufferLast<CR>"

    ;; Close buffer
    "<A-c>" ":BufferClose<CR>"
    "<leader><A-c>" ":BufferCloseAllButCurrent<CR>"

   ;; Magic buffer-picking mode
    "<C-p>" ":BufferPick<CR>"

    ;; Sort automatically by...
    "<Space>bb" ":BufferOrderByBufferNumber<CR>"
    "<Space>bd" ":BufferOrderByDirectory<CR>"
    "<Space>bl" ":BufferOrderByLanguage<CR>"
})
