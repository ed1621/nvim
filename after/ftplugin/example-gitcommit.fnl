(import-macros {: exec} :hibiscus.vim)
(local utils (require :core.mappings.mapping-utils))

(vim.api.nvim_buf_set_option 0 "textwidth" 72)

(fn get-row-col [] (unpack (vim.api.nvim_win_get_cursor 0)))

(fn write-to-buffer [text]
  (let [(row col) (get-row-col)
        actual-row (- row 1)]
    (vim.api.nvim_buf_set_text 0 actual-row col actual-row col [text])))

(fn someone []
  (write-to-buffer "Co-Authored-By: Someone <someEmail@someDomain.com>")
  (exec [[:normal "o"]]))

(utils.bulk-add-normal-mappings {
  "<leader>so" someone})

