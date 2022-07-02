-- :fennel:1656722188
vim.opt["syntax"] = "true"
vim.opt["completeopt"] = "menuone,noinsert,noselect"
vim.opt["encoding"] = "utf-8"
vim.opt["showmode"] = false
vim.opt["ruler"] = false
vim.opt["wrap"] = false
vim.opt["cmdheight"] = 1
vim.g["loaded_gzip"] = 0
vim.g["loaded_tar"] = 0
vim.g["loaded_tarPlugin"] = 0
vim.g["loaded_zipPlugin"] = 0
vim.g["loaded_2html_plugin"] = 0
vim.g["loaded_netrw"] = 0
vim.g["loaded_netrwPlugin"] = 0
vim.g["loaded_matchit"] = 0
vim.g["loaded_gzip"] = 0
vim.g["loaded_spec"] = 0
for _, opt in ipairs({"number", "ai", "vb", "expandtab", "cursorline", "termguicolors", "splitright", "splitbelow", "hidden", "autoread"}) do
  vim.opt[opt] = true
end
for _, opt in ipairs({"tabstop", "softtabstop", "shiftwidth"}) do
  vim.opt[opt] = 2
end
return nil