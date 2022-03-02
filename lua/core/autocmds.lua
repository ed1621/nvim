vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])

-- vim.cmd([[
--     augroup reloadonsave
--         au!
--         au bufwritepost init.lua source $MYVIMRC
--         au bufwritepost plugins.lua source $MYVIMRC
--         au bufwritepost mappings.lua source $MYVIMRC
--         au bufwritepost options.lua source $MYVIMRC
--         au bufwritepost commands.vim source $MYVIMRC
--     augroup end
-- ]])

vim.cmd [[hi! link LspReferenceText CursorColumn]]
vim.cmd [[hi! link LspReferenceRead CursorColumn]]
vim.cmd [[hi! link LspReferenceWrite CursorColumn]]
