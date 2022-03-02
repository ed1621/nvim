vim.cmd [[hi! link LspReferenceText CursorColumn]]
vim.cmd [[hi! link LspReferenceRead CursorColumn]]
vim.cmd [[hi! link LspReferenceWrite CursorColumn]]

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = '*',
  callback = function ()
    require('vim.highlight') .on_yank()   
  end
})
