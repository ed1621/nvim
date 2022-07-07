(local utils (require :core.mappings.mapping-utils))

(utils.bulk-add-normal-mappings {
  "<leader>fo" ":lua require('telescope.builtin').oldfiles{only_cwd = true}<CR><ESC>"
  "<leader>f" ":Telescope find_files<CR>"
  "<leader>g" ":Telescope git_files<CR>"
  "<leader>mp" ":Telescope man_pages<CR><ESC>"
  "<leader>r" ":Telescope registers<CR><ESC>"
  "<leader>tr" ":Telescope resume<CR><ESC>"
  "<leader><leader>f" ":Telescope live_grep<CR>"
  "<leader><leader>b" ":Telescope buffers<CR><ESC>"
  ;; Telescope LSP
  "<leader>lr" ":Telescope lsp_references<CR><ESC>"
  "<leader><leader>ld" ":Telescope lsp_definitions<CR><ESC>"
  "<leader>ltd" ":Telescope lsp_type_definitions<CR><ESC>"
  "<leader>li" ":Telescope lsp_implementations<CR><ESC>"
  "<leader>lca" ":Telescope lsp_code_actions<CR><ESC>"
  "<leader>lds" ":Telescope lsp_document_symbols<CR><ESC>"
  "<leader>lws" ":Telescope lsp_dynamic_workspace_symbols<CR><ESC>"
  "<leader>ld" ":lua require('telescope.builtin'.lsp_diagnositcs{bufnr = 0}<CR><ESC>"
  "<leader>td" ":Telescope diagnostics<CR>"
  ;; Telescope Git
  "<leader>gc" ":Telescope git_commits<CR><ESC>"
  "<leader>gb" ":Telescope git_branches<CR><ESC>"
  "<leader>gst" ":Telescope git_status<CR><ESC>"
})
